`timescale 1ns / 1ps
module test;

// Inputs
reg A;
reg B;
reg C;

// Outputs
wire Y;

boolean uut (
.A(A),
.B(B),
.C(C),
.Y(Y)
);

initial 
begin

$dumpfile("test.vcd");
$dumpvars(0, test);

A = 0;   //test cases
B = 0;
C = 0;
#100;
A = 0;
B = 0;
C = 1;
#100;
A = 0;
B = 1;
C = 0;
#100;
A = 0;
B = 1;
C = 1;
#100;
A = 1;
B = 0;
C = 0;
#100;
A = 1;
B = 0;
C = 1;
#100;
A = 1;
B = 1;
C = 0;
#100;
A = 1;
B = 1;
C = 1;
#100;

$display("This program demonstrates the logic for the circuit: Y=A'B'+A'BC'+(A+C')' to the monitor.");
$finish;
end
endmodule
