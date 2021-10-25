TEST_ZP_ADDR = $0F
TEST_ZP_DAT = %11001001
ZP_SUCCESS_MOD = %0010000

TEST_STACK_DAT = %01101100
STACK_SUCCESS_MOD = %0001000

TEST_GEN_ADDR = $106F
TEST_GEN_DAT = %01011010
GEN_SUCCESS_MOD = %0000100

post:
  lda #%11111111
  sta DDRB

  lda #0

  lda #%10000000
  sta PORTB

  tax
  txa

  ora #%01000000
  sta PORTB

  tax

  lda #TEST_ZP_DAT
  sta TEST_ZP_ADDR

  lda TEST_ZP_ADDR
  cmp #TEST_ZP_DAT

  beq ZP_SUCCESS
  jmp stage2

ZP_SUCCESS:
  txa
  ora #ZP_SUCCESS_MOD

  sta PORTB
  jmp stage2

stage2:
  tax

  lda #TEST_STACK_DAT
  pha

  pla
  cmp #TEST_STACK_DAT

  beq STACK_SUCCESS
  jmp stage3

STACK_SUCCESS:
  txa  
  ora #STACK_SUCCESS_MOD

  sta PORTB
  jmp stage3

stage3:
  tax

  lda #TEST_GEN_DAT
  sta TEST_GEN_ADDR

  lda TEST_GEN_ADDR
  cmp #TEST_GEN_DAT

  beq GEN_SUCCESS
  jmp return_post

GEN_SUCCESS:
  txa  
  ora #GEN_SUCCESS_MOD

  sta PORTB
  jmp return_post