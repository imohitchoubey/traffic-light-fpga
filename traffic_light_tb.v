module traffic_light_tb;

    reg clk, reset, emergency;
    wire red, yellow, green;

    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .emergency(emergency),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        emergency = 0;

        #10 reset = 0;
        #60 emergency = 1;
        #20 emergency = 0;

        #100 $stop;
    end
endmodule
