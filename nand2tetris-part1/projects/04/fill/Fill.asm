// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(INITIALIZE)
    @R1
    MD=0         // R1 = D = 0

    @8192
    D=A          // D = 8192

    @R1
    M=D          // R1 = D (R1 is our word index into screen memory)

(WHILE_TRUE)
    @KBD
    D=M          // Load keyboard value

    @SET_COLOR
    D;JEQ        // If we are 0 then carry on

    D=-1         // Otherwise a key is pressed, so set our color to black (-1)

(SET_COLOR)
    @R0
    M=D          // R0 = 1 (set our color to animate)

    @R1
    D=M          // D = Row number to write

    @INITIALIZE
    D;JLT        // If R1 < 0 goto INITIALIZE

    @SCREEN
    D=D+A        // Calculate our address to write

    @R2
    M=D          // R2 = R1 + SCREEN

    @R0
    D=M          // D = R0 (the value we want to set the screen to)

    @R2
    A=M          // A = R2 (our computed screen address)
    M=D          // Set piece of the screen to black or white

    @R1
    M=M-1        // R1--

    @WHILE_TRUE
    0;JMP        // Goto WHILE_TRUE
