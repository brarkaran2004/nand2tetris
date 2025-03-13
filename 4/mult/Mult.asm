// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.



@I
M=1

@R2
M=0

(LOOP)
@R0
D=M

@R2
M=D+M

@I
D=M

@R1
D=M-D


@END
D;JEQ

@I
D=M
M=D+1

@LOOP
0;JEQ



(END)
@END
0;JEQ





