module led_top (
    input sys_clk,
    input rst_n,
    output led_1,
    output led_2
);

wire main_clk;
wire locked;

clk_wiz_main u_pll_main (
    .clk_in1    (sys_clk),      // 50Mhz in
    .resetn     (rst_n),
    .clk_out1   (main_clk),     // 100Mhz out
    .locked     (locked)
);

assign led_2 = !locked;         // Locked is an active low signal

clk_div #(
    .DIVIDE_BY(32'd50_000_000)  // 100Mhz / 50,000,000 = 2Hz (500ms)
) u_clk_div_1G (
    .clk_in     (main_clk),
    .rst_n      (rst_n),
    .clk_out    (led_1)         // Blink in 500ms period
);

endmodule
