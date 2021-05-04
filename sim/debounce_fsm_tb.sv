module debounce_fsm_tb ();

    timeunit 1ns;
    timeprecision 1ps;

    parameter CLOCK_PERIOD_NS = 10;

    logic clock;
    logic bouncing_signal;
    logic debounced_signal;

    // Clock generation
    initial begin
        clock = 1'b0;
        forever begin
            #(CLOCK_PERIOD_NS / 2);
            clock = ~ clock;
        end
    end

    // DUT Instantiation
    debounce_fsm # (
        .DEBOUNCE_COUNTER_WIDTH (24)
    )
    debounce_fsm_inst (
        .i_clock            (clock),
        .i_debounce_counter (24'd10),
        .i_bouncing_signal  (bouncing_signal),
        .o_debounced_signal (debounced_signal)
    );

    // Stimuli
    initial begin
        bouncing_signal = 1'b0;
        repeat (2) @(posedge clock);
        bouncing_signal = 1'b1;
        repeat (3) @(posedge clock);
        bouncing_signal = 1'b0;
        repeat (5) @(posedge clock);
        bouncing_signal = 1'b1;
        repeat (1) @(posedge clock);
        bouncing_signal = 1'b0;
        repeat (3) @(posedge clock);
        bouncing_signal = 1'b1;
        repeat (2) @(posedge clock);
        bouncing_signal = 1'b0;
        repeat (1) @(posedge clock);
        bouncing_signal = 1'b1;
        repeat (1) @(posedge clock);
        bouncing_signal = 1'b0;
        repeat (2) @(posedge clock);
        bouncing_signal = 1'b1;
    end

    // End of Simulation
    initial begin
        repeat (50) @(posedge clock);
        $finish();
    end

endmodule