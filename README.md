# 6502-selftest

A POST (Power On Self-Test) sequence for 6502-based computers using Ben Eater's design

To use, include the file, and then insert this line
```assembly
jmp post
```

Then include a label called return_post
