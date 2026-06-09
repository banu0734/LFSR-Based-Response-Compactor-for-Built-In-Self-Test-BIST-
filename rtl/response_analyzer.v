//---------------------------------------------------
// Response Analyzer
//---------------------------------------------------

module response_analyzer(

input [2:0] signature,

input [2:0] reference,

output detected

);

assign detected=
(signature!=reference);

endmodule
