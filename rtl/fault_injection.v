//---------------------------------------------------
// Fault Injection Logic
//---------------------------------------------------

module fault_injection(

input a,
input b,

input a_sa0,
input a_sa1,

input b_sa0,
input b_sa1,

output fault_a,
output fault_b

);

assign fault_a =
a_sa0 ? 1'b0 :
a_sa1 ? 1'b1 :
a;

assign fault_b =
b_sa0 ? 1'b0 :
b_sa1 ? 1'b1 :
b;

endmodule
