// VM Code: push constant 3030
// D=integer
@3030
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop pointer 0
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@3
M=D

// VM Code: push constant 3040
// D=integer
@3040
D=A

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

// VM Code: push constant 32
// D=integer
@32
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop this 2
// D=integer
@2
D=A
@THIS
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

// VM Code: push constant 46
// D=integer
@46
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop that 6
// D=integer
@6
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

// VM Code: push pointer 0
@3
D=M

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

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

// VM Code: push this 2
// D=integer
@2
D=A
@THIS
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

// VM Code: push that 6
// D=integer
@6
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