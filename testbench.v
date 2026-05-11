module tb_DENLMS;

reg clk;
reg rst;
reg signed [15:0] data_in;
reg signed [15:0] desired;

wire signed [15:0] y_out;
wire signed [15:0] error;

integer k;

DENLMS_filter uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .desired(desired),
    .y_out(y_out),
    .error(error)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    data_in = 0;
    desired = 0;

    #20 rst = 0;

    for (k = 0; k < 40; k = k + 1) begin
        data_in = k;
        desired = k + 10;
        #10;
    end

    #100 $finish;
end

endmodule
