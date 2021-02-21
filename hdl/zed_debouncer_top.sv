module zed_debouncer_top
    (
        // Clock
        input   logic i_clock,
        // Input switches
        input   logic i_sw0,
        input   logic i_sw1,
        input   logic i_sw2,
        input   logic i_sw3,
        input   logic i_sw4,
        input   logic i_sw5,
        input   logic i_sw6,
        input   logic i_sw7,
        // Input buttons
        input   logic i_btnu,
        input   logic i_btnd,
        input   logic i_btnl,
        input   logic i_btnr,
        input   logic i_btnc,
        // Output LEDs
        output  logic o_ld0,
        output  logic o_ld1,
        output  logic o_ld2,
        output  logic o_ld3,
        output  logic o_ld4,
        output  logic o_ld5,
        output  logic o_ld6,
        output  logic o_ld7
    );

    timeunit 1ns;
    timeprecision 1ps;

    logic sw0;
    logic sw1;
    logic sw2;
    logic sw3;
    logic sw4;
    logic sw5;
    logic sw6;
    logic sw7;
    logic btnu;
    logic btnd;
    logic btnl;
    logic btnr;
    logic btnc;
    
    zed_debouncer
    # (
        .SWITCH_COUNT           (8),
        .BUTTON_COUNT           (5),
        .DEBOUNCE_COUNTER_WIDTH (16)
    )
    zed_debouncer_inst
    (
        // Clock
        .i_clock                    (i_clock),
        // Debounce counter values
        .i_switch_debounce_counter  (16'd1000),
        .i_button_debounce_counter  (16'd1000),
        // Input switches
        .i_sw0                      (i_sw0),
        .i_sw1                      (i_sw1),
        .i_sw2                      (i_sw2),
        .i_sw3                      (i_sw3),
        .i_sw4                      (i_sw4),
        .i_sw5                      (i_sw5),
        .i_sw6                      (i_sw6),
        .i_sw7                      (i_sw7),
        // Input buttons
        .i_btnu                     (i_btnu),
        .i_btnd                     (i_btnd),
        .i_btnl                     (i_btnl),
        .i_btnr                     (i_btnr),
        .i_btnc                     (i_btnc),
        // Debounced switch outputs
        .o_sw0                      (sw0),
        .o_sw1                      (sw1),
        .o_sw2                      (sw2),
        .o_sw3                      (sw3),
        .o_sw4                      (sw4),
        .o_sw5                      (sw5),
        .o_sw6                      (sw6),
        .o_sw7                      (sw7),
        // Debounced button outputs
        .o_btnu                     (btnu),
        .o_btnd                     (btnd),
        .o_btnl                     (btnl),
        .o_btnr                     (btnr),
        .o_btnc                     (btnc)
    );

    assign o_ld0 = (sw0 | btnu | btnd | btnl | btnr | btnc);    // LD0 can be activated by SW0 or any of the pushbuttons
    assign o_ld1 = sw1;
    assign o_ld2 = sw2;
    assign o_ld3 = sw3;
    assign o_ld4 = sw4;
    assign o_ld5 = sw5;
    assign o_ld6 = sw6;
    assign o_ld7 = sw7;

endmodule