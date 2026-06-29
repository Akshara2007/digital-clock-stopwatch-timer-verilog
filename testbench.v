module testbench;

reg clk;
reg reset;

wire [5:0] seconds;
wire [5:0] minutes;
wire [4:0] hours;


// Connect the design with testbench
digital_clock DUT (
    .clk(clk),
    .reset(reset),
    .seconds(seconds),
    .minutes(minutes),
    .hours(hours)
);


// Generate clock signal
initial
begin
    clk = 0;
    forever #10 clk = ~clk;
end


// Apply reset and run simulation
initial
begin
    reset = 1;

    #100;

    reset = 0;

    #1000;

    $finish;
end


// Display output
initial
begin
    $monitor("Time = %0d:%0d:%0d", hours, minutes, seconds);
end

endmodule
