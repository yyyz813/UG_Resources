module Fib_tb;  //test bench
reg A3, A2, A1, A0;
wire Y;
integer i;

Fib DUT (.A3(A3), .A2(A2), .A1(A1), .A0(A0), .Y(Y));

initial
begin
$monitor("A3 = %d, A2 = %d, A1 = %d, A0 = %d, Y = %d", A3, A2, A1, A0, Y);  // screen output
for (i = 0; i < 16; i = i + 1) begin  // check number from 1-15
{A3, A2, A1, A0} = i ; #10;
end
end
endmodule
