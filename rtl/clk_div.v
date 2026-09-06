module clk_div (
    input clk_in,
    input rst_n,
    output reg clk_out
);

// Maximum divide value is 2^32-1
parameter DIVIDE_BY = 100_000_000;

reg [31:0] clk_cnt;

always @ (posedge clk_in or negedge rst_n) begin
    if (!rst_n) begin
        clk_cnt <= 0;
        clk_out <= 0;
    end else begin
        if (clk_cnt < ( (DIVIDE_BY>>1) - 1) ) begin
            clk_cnt <= clk_cnt + 1;
            clk_out <= clk_out;
        end else begin
            clk_cnt <= 0;
            clk_out <= ~clk_out;
        end
    end
end


endmodule
