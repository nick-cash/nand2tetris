// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    // Initialize output to zero
    @R2
    M=0

    // Initialize our counter
    @R0
    D=M  // D = R0

    @R3
    M=D  // R3 = D

(LOOP)
    @R3
    D=M    //  D = R3

    @END
    D;JLE  //  If R3 < 0 goto END

    @R3
    M=M-1  // R3--

    @R1
    D=M    // D = R1

    @R2
    M=D+M  // R2 += D

    @LOOP
    0;JMP  // Goto LOOP

(END)
    @END
    0;JMP
