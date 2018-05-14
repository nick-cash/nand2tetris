// VM Code: push constant 17
// D=integer
@17
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 17
// D=integer
@17
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: eq
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

// JMP to label_or_address if D == 0
@IF_TRUE_0
D;JEQ
D=0

// JMP to label_or_address
@IF_END_0
0;JMP
(IF_TRUE_0)
D=-1
(IF_END_0)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 17
// D=integer
@17
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 16
// D=integer
@16
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: eq
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

// JMP to label_or_address if D == 0
@IF_TRUE_1
D;JEQ
D=0

// JMP to label_or_address
@IF_END_1
0;JMP
(IF_TRUE_1)
D=-1
(IF_END_1)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 16
// D=integer
@16
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 17
// D=integer
@17
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: eq
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

// JMP to label_or_address if D == 0
@IF_TRUE_2
D;JEQ
D=0

// JMP to label_or_address
@IF_END_2
0;JMP
(IF_TRUE_2)
D=-1
(IF_END_2)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 892
// D=integer
@892
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 891
// D=integer
@891
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: lt
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

// JMP to label_or_address if D < 0
@IF_TRUE_3
D;JLT
D=0

// JMP to label_or_address
@IF_END_3
0;JMP
(IF_TRUE_3)
D=-1
(IF_END_3)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 891
// D=integer
@891
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 892
// D=integer
@892
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: lt
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

// JMP to label_or_address if D < 0
@IF_TRUE_4
D;JLT
D=0

// JMP to label_or_address
@IF_END_4
0;JMP
(IF_TRUE_4)
D=-1
(IF_END_4)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 891
// D=integer
@891
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 891
// D=integer
@891
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: lt
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

// JMP to label_or_address if D < 0
@IF_TRUE_5
D;JLT
D=0

// JMP to label_or_address
@IF_END_5
0;JMP
(IF_TRUE_5)
D=-1
(IF_END_5)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 32767
// D=integer
@32767
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 32766
// D=integer
@32766
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: gt
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

// JMP to label_or_address if D > 0
@IF_TRUE_6
D;JGT
D=0

// JMP to label_or_address
@IF_END_6
0;JMP
(IF_TRUE_6)
D=-1
(IF_END_6)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 32766
// D=integer
@32766
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 32767
// D=integer
@32767
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: gt
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

// JMP to label_or_address if D > 0
@IF_TRUE_7
D;JGT
D=0

// JMP to label_or_address
@IF_END_7
0;JMP
(IF_TRUE_7)
D=-1
(IF_END_7)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 32766
// D=integer
@32766
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 32766
// D=integer
@32766
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: gt
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

// JMP to label_or_address if D > 0
@IF_TRUE_8
D;JGT
D=0

// JMP to label_or_address
@IF_END_8
0;JMP
(IF_TRUE_8)
D=-1
(IF_END_8)

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 57
// D=integer
@57
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 31
// D=integer
@31
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 53
// D=integer
@53
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

// VM Code: push constant 112
// D=integer
@112
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

// VM Code: neg
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// D=-D
D=-D

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: and
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

// D=D&A
D=D&A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: push constant 82
// D=integer
@82
D=A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: or
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

// D=D|A
D=D|A

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1

// VM Code: not
// SP--
@SP
M=M-1

// D=*SP
@SP
A=M
D=M

// !D
D=!D

// *SP=D
@SP
A=M
M=D

// SP++
@SP
M=M+1