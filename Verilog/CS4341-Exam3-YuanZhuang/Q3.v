// Fibonacci number are 0,1,2,3,5,8,13

module Fib(A3, A2, A1, A0, Y);  // defined input and output
input A3, A2, A1, A0;
output reg Y;
always @(A3, A2, A1, A0)
begin
case ({A3, A2, A1, A0})   // test cases for these 4 bits
4'd0 : Y = 1'b1;   // if 4 bit number 0, then output 1 bit 1
4'd1 : Y = 1'b1;   // if 4 bit number 1, then output 1 bit 1
4'd2 : Y = 1'b1;
4'd3 : Y = 1'b1;
4'd4 : Y = 1'b0;   // if 4 bit number 4, then output 1 bit 0, means it is not fibo number
4'd5 : Y = 1'b1;
4'd6 : Y = 1'b0;
4'd7 : Y = 1'b0;
4'd8 : Y = 1'b1;
4'd9 : Y = 1'b0;
4'd10 : Y = 1'b0;
4'd11 : Y = 1'b0;
4'd12 : Y = 1'b0;
4'd13 : Y = 1'b1;
4'd14 : Y = 1'b0;
4'd15 : Y = 1'b0;
default : Y = 1'b0;
endcase
end
endmodule
