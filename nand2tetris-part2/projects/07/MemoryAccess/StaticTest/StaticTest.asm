// VM Code: push constant 111
// D=integer
@111
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 333
// D=integer
@333
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 888
// D=integer
@888
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop static 8
// D=integer
@0
D=A
@StaticTest.8
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

// VM Code: pop static 3
// D=integer
@0
D=A
@StaticTest.3
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

// VM Code: pop static 1
// D=integer
@0
D=A
@StaticTest.1
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

// VM Code: push static 3
// D=integer
@0
D=A
@StaticTest.3
A=D+M
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push static 1
// D=integer
@0
D=A
@StaticTest.1
A=D+M
D=M

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

// VM Code: push static 8
// D=integer
@0
D=A
@StaticTest.8
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