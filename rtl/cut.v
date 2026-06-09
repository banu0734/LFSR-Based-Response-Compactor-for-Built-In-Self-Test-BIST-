//---------------------------------------------------
// Circuit Under Test
// q = ab + (a+b)c'
//---------------------------------------------------

module cut(

input a,
input b,
input c,

output q

);

assign q=(a&b)|((a|b)&(~c));

endmodule
