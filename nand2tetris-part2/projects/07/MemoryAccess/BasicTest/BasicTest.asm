// VM Code: push constant 10
// D=integer
@10
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

// VM Code: push constant 21
// D=integer
@21
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 22
// D=integer
@22
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop argument 2
// D=integer
@2
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

// VM Code: pop argument 1
// D=integer
@1
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

// VM Code: push constant 36
// D=integer
@36
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop this 6
// D=integer
@6
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

// VM Code: push constant 42
// D=integer
@42
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 45
// D=integer
@45
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop that 5
// D=integer
@5
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

// VM Code: push constant 510
// D=integer
@510
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: pop temp 6
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M
@11
M=D

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

// VM Code: push that 5
// D=integer
@5
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

// VM Code: push this 6
// D=integer
@6
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

// VM Code: push this 6
// D=integer
@6
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

// VM Code: push temp 6
@11
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