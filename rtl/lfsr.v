//---------------------------------------------------
// 3-bit LFSR
//---------------------------------------------------

module lfsr(

input clk,

input q,

output reg [2:0] signature

);

wire feedback;

assign feedback=
signature[2]^signature[1]^q;

always @(posedge clk)

begin

signature<={
signature[1],
signature[0],
feedback
};

end

endmodule
