`timescale 1ns/1ps

// -----------------------------------------------------------------------------
// Testbench: tb_odd_dv
// Description:
//   Testbench for the odd_div module. It verifies the clock divider functionality
//   for various odd and even division values. The testbench applies reset and
//   changes div_val to different values, monitoring the output clkout.
//
// Scenarios Tested:
//   1. div_val = 3 (odd)
//   2. div_val = 5 (odd)
//   3. div_val = 7 (odd)
//   4. div_val = 4 (even)
//   5. div_val = 6 (even)
//   6. div_val = 8 (even)
//
// Features:
//   - Generates a 100MHz clock.
//   - Applies reset and sets div_val for each scenario.
//   - Dumps waveform to tb_odd_dv.vcd for analysis.
//   - Monitors and displays key signals during simulation.
// -----------------------------------------------------------------------------

module tb_odd_dv;

logic resetn;
logic [7:0] div_val;
logic clk;
logic clkout;

odd_div uut (
    .resetn(resetn),
    .div_val(div_val),
    .clk(clk),
    .clkout(clkout)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 100MHz clock

// Test sequence
initial begin
    $dumpfile("tb_odd_dv.vcd");
	$dumpvars(0,tb_odd_dv);
    $display("Starting odd_div testbench...");
    resetn = 0;
    div_val = 3;
    #20;
    resetn = 1;
    #100;
    $display("Test 1: div_val = 3");

    //resetn = 0;
    div_val = 5;
    #20;
    resetn = 1;
    #100;
    $display("Test 2: div_val = 5");

    //resetn = 0;
    div_val = 7;
    #20;
    resetn = 1;
    #200;
    $display("Test 3: div_val = 7");

    //resetn = 0;
    div_val = 4;
    #20;
    resetn = 1;
    #100;
    $display("Test 4: div_val = 4");

    //resetn = 0;
    div_val = 6;
    #20;
    resetn = 1;
    #100;
    $display("Test 5: div_val = 6");

    //resetn = 0;
    div_val = 8;
    #20;
    resetn = 1;
    #400;
    $display("Test 6: div_val = 8");

    $finish;
end

// Optional: monitor signals
initial begin
    $monitor("Time=%0t | resetn=%b | div_val=%0d | clkout=%b", $time, resetn, div_val, clkout);
end

initial begin
    #2000;
    $finish;
end

endmodule