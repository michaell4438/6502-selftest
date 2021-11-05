TEST_ZP_ADDR = $0F
TEST_ZP_DAT = %11001001
ZP_SUCCESS_MOD = %0001000

TEST_STACK_DAT = %01101100
STACK_SUCCESS_MOD = %0010000

TEST_GEN_ADDR = $106F
TEST_GEN_DAT = %01011010
GEN_SUCCESS_MOD = %0000100


post_fail:
  jmp post_fail
post:
  lda #%11111111
  sta DDRB

  lda #0

  lda #%10000000
  sta PORTB

  ora #%01000000
  sta PORTB

  pha

  lda #TEST_STACK_DAT
  pha
  lda #$FF
  pla

  cmp #TEST_STACK_DAT

  beq stage2
  jmp post_fail

stage2:
  pla

  ora #STACK_SUCCESS_MOD
  sta PORTB

  pha 

  lda #TEST_ZP_DAT
  sta TEST_ZP_ADDR
  lda #$FF
  
  lda TEST_ZP_ADDR

  cmp #TEST_ZP_DAT

  beq stage3
  jmp post_fail

stage3:
  pla

  ora #ZP_SUCCESS_MOD
  sta PORTB

  pha 

  lda #TEST_GEN_DAT
  sta TEST_GEN_ADDR
  lda #$FF
  
  lda TEST_GEN_ADDR

  cmp #TEST_GEN_DAT

  beq stage4
  jmp post_fail

stage4:
  pla

  ora #GEN_SUCCESS_MOD
  sta PORTB

  jmp return_post