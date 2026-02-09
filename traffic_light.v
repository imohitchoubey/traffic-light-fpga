module traffic_light(
    input clk,
    input reset,
    input emergency,
    output reg red,
    output reg yellow,
    output reg green
);

    reg [1:0] state;
    reg [3:0] counter;

    parameter RED = 2'b00;
    parameter GREEN = 2'b01;
    parameter YELLOW = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= RED;
            counter <= 0;
        end
        else if (emergency) begin
            state <= GREEN;
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
            case (state)
                RED: if (counter == 5) begin
                        state <= GREEN;
                        counter <= 0;
                     end
                GREEN: if (counter == 5) begin
                        state <= YELLOW;
                        counter <= 0;
                       end
                YELLOW: if (counter == 2) begin
                        state <= RED;
                        counter <= 0;
                        end
            endcase
        end
    end

    always @(*) begin
        red = 0; yellow = 0; green = 0;
        case (state)
            RED: red = 1;
            GREEN: green = 1;
            YELLOW: yellow = 1;
        endcase
    end

endmodule
