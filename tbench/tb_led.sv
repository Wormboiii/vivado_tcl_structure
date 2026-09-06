`timescale 1ns/10ps

module tb_led ();

reg clk;
reg rst_n;
wire led_1, led_2;


initial begin
    $display("Started simulation\n");
    clk = 0;
    rst_n = 0;

    #10 rst_n = 1;
    $display("Released reset at: %t\n", $time);

    #10_000 
    $display("Simulation end at: %t\n", $time);
    $finish;
    
end

always begin
    #10 clk = ~clk; // Gen 50Mhz clk
end



led_top u_top(
    /*input */  .sys_clk    (clk),
    /*input */  .rst_n      (rst_n),
    /*output*/  .led_1      (led_1),
    /*output*/  .led_2      (led_2)

);

// Override clock div parameter
defparam u_top.u_clk_div_1G.DIVIDE_BY = 32'd2;


endmodule