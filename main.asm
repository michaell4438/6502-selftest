PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

  .org $8000

reset:
  include "post.asm"

  jmp post

return_post:
  jmp return_post


  .org $fffc
  .word reset
  .word 0000