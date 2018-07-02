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

// VM Code: pop local 0
// D=integer
@0
D=A
@LCL
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

// VM Code: label LOOP_START
// Emit Label
(LOOP_START)

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

// VM Code: push local 0
// D=integer
@0
D=A
@LCL
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

// VM Code: pop local 0
// D=integer
@0
D=A
@LCL
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

// VM Code: if-goto LOOP_START
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// JMP to label_or_address if D != 0
@LOOP_START
D;JNE

// VM Code: push local 0
// D=integer
@0
D=A
@LCL
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1