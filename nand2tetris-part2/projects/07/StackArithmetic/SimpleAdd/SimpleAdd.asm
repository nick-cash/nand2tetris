// VM Code: push constant 7
// D=integer
@7
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 8
// D=integer
@8
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