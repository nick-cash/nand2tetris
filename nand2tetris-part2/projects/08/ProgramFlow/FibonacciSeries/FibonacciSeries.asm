// VM Code: push argument 1
// D=integer
@1
D=A
@ARG
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop pointer 1
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@4
M=D

// VM Code: push constant 0
// D=integer
@0
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop that 0
// D=integer
@0
D=A
@THAT
D=D+M
@R15
M=D

// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@R15
A=M
M=D

// VM Code: push constant 1
// D=integer
@1
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop that 1
// D=integer
@1
D=A
@THAT
D=D+M
@R15
M=D

// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@R15
A=M
M=D

// VM Code: push argument 0
// D=integer
@0
D=A
@ARG
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 2
// D=integer
@2
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: sub
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// SP--
@SP
M=M-1

// A=*SP
@SP
A=M
A=M

// D=A-D
D=A-D

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop argument 0
// D=integer
@0
D=A
@ARG
D=D+M
@R15
M=D

// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@R15
A=M
M=D

// VM Code: label MAIN_LOOP_START
// Emit Label
(MAIN_LOOP_START)

// VM Code: push argument 0
// D=integer
@0
D=A
@ARG
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: if-goto COMPUTE_ELEMENT
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// JMP to label_or_address if D != 0
@COMPUTE_ELEMENT
D;JNE

// VM Code: goto END_PROGRAM
// JMP to label_or_address
@END_PROGRAM
0;JMP

// VM Code: label COMPUTE_ELEMENT
// Emit Label
(COMPUTE_ELEMENT)

// VM Code: push that 0
// D=integer
@0
D=A
@THAT
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push that 1
// D=integer
@1
D=A
@THAT
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: add
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// SP--
@SP
M=M-1

// A=*SP
@SP
A=M
A=M

// D=D+A
D=D+A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop that 2
// D=integer
@2
D=A
@THAT
D=D+M
@R15
M=D

// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@R15
A=M
M=D

// VM Code: push pointer 1
@4
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 1
// D=integer
@1
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: add
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// SP--
@SP
M=M-1

// A=*SP
@SP
A=M
A=M

// D=D+A
D=D+A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop pointer 1
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@4
M=D

// VM Code: push argument 0
// D=integer
@0
D=A
@ARG
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 1
// D=integer
@1
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: sub
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// SP--
@SP
M=M-1

// A=*SP
@SP
A=M
A=M

// D=A-D
D=A-D

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop argument 0
// D=integer
@0
D=A
@ARG
D=D+M
@R15
M=D

// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@R15
A=M
M=D

// VM Code: goto MAIN_LOOP_START
// JMP to label_or_address
@MAIN_LOOP_START
0;JMP

// VM Code: label END_PROGRAM
// Emit Label
(END_PROGRAM)