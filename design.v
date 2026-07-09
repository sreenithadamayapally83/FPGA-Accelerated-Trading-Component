module PriceComparator (
    input wire clk, reset,
    input wire [31:0] market_price, threshold,
    output reg buy_signal, sell_signal
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            buy_signal  <= 1'b0;
            sell_signal <= 1'b0;
        end else begin
            if (market_price < threshold) begin
                buy_signal  <= 1'b1;
                sell_signal <= 1'b0;
            end else if (market_price > threshold) begin
                buy_signal  <= 1'b0;
                sell_signal <= 1'b1;
            end else begin
                buy_signal  <= 1'b0;
                sell_signal <= 1'b0;
            end
        end
    end
endmodule
