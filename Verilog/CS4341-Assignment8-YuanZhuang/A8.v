
module boolean(   
input A,B,C,
output Y
);

wire W1,W2,W3,Abar,Bbar,Cbar;
not NOTA(Abar, A);
not NOTB(Bbar, B);
not NOTC(Cbar, C);
and ANDW1(W1,Abar,Bbar);  //W1=A'B'
and ANDW2(W2,Abar,B,Cbar);  //W2=A'BC'
nor NORW3(W3,A,Cbar);  //W3=(A+C')'
or ORY(Y,W1,W2,W3);   // Y=W1+W2+W3

endmodule