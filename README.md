# 6502-selftest

A POST (Power On Self-Test) sequence for 6502-based computers using Ben Eater's design

To use, include the file, and then insert this line
```assembly
jmp post
```

Then include a label called return_post

It also requires constants for
 - PORTA
 - PORTB
 - DDRA
 - DDRB

Assuming you are using a 65c22 with 5 or more LEDs on PORTB, you should get this result:
 - LED 1: This LED should always activate.
 - LED 2: This LED should ALSO always activate. This and LED 1 are your verification signals
 - LED 3: This LED activates in the event that writing to the zero page was successful
 - LED 4: THis LED activates if the stack is operational
 - LED 5: This LED activates if a memory region just outside of the stack and zero page is operational
