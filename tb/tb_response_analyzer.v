//---------------------------------------------------
// Testbench for LFSR Response Compactor
//---------------------------------------------------

module tb_response_analyzer;

reg clk;

reg a;
reg b;
reg c;

reg a_sa0;
reg a_sa1;

reg b_sa0;
reg b_sa1;

wire fault_a;
wire fault_b;

wire q;

wire [3:0] count;

wire [2:0] signature;

wire detected;

// Clock

always #5 clk=~clk;

// Fault Injection

fault_injection FI(

.a(a),
.b(b),

.a_sa0(a_sa0),
.a_sa1(a_sa1),

.b_sa0(b_sa0),
.b_sa1(b_sa1),

.fault_a(fault_a),
.fault_b(fault_b)

);

// Circuit Under Test

cut CUT(

.a(fault_a),
.b(fault_b),
.c(c),

.q(q)

);

// Transition Counter

transition_counter TC(

.clk(clk),

.signal_in(q),

.count(count)

);

// LFSR

lfsr LFSR(

.clk(clk),

.q(q),

.signature(signature)

);

// Response Analyzer

response_analyzer RA(

.signature(signature),

.reference(3'b010),

.detected(detected)

);

// Stimulus

initial

begin

clk=0;

a_sa0=0;
a_sa1=0;

b_sa0=0;
b_sa1=0;

// Fault Free

a=0;b=0;c=0;

#10 a=0;b=0;c=1;

#10 a=0;b=1;c=0;

#10 a=0;b=1;c=1;

#10 a=1;b=0;c=0;

#10 a=1;b=0;c=1;

#10 a=1;b=1;c=0;

#10 a=1;b=1;c=1;

// Inject Fault

a_sa0=1;

#80;

$finish;

end

// Display

always @(posedge clk)

begin

$display(

"a=%b b=%b c=%b q=%b count=%d signature=%b detected=%b",

a,
b,
c,

q,

count,

signature,

detected

);

end

endmodule
