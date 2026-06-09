//---------------------------------------------------
// Transition Counter
//---------------------------------------------------

module transition_counter(

input clk,
input signal_in,

output reg [3:0] count

);

reg previous;

always @(posedge clk)

begin

if(signal_in!=previous)

count<=count+1;

previous<=signal_in;

end

endmodule
