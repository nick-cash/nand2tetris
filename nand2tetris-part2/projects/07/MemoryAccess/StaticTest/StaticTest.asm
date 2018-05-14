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
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@StaticTest.8
M=D

// VM Code: pop static 3
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@StaticTest.3
M=D

// VM Code: pop static 1
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@StaticTest.1
M=D

// VM Code: push static 3
@StaticTest.3
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push static 1
@StaticTest.1
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
@StaticTest.8
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