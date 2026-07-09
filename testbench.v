`timescale 1ns/1ps
module tb_PriceComparator;
    reg clk, reset;
    reg [31:0] market_price, threshold;
    wire buy_signal, sell_signal;

    PriceComparator uut (
        .clk(clk), .reset(reset), .market_price(market_price),
        .threshold(threshold), .buy_signal(buy_signal), .sell_signal(sell_signal)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_PriceComparator);
        clk = 0; reset = 1; market_price = 0; threshold = 32'd100;
        #10; reset = 0;
        #10; market_price = 32'd100;
        #10; market_price = 32'd95;
        #10; market_price = 32'd105;
        #10; market_price = 32'd100;
        #20; $finish;
    end
endmodule
