module fulladder_1bit (
    input wire _a,
    input wire _b,
    input wire _c_in,
    output wire _sum,
    output wire _c_out
);

    wire xor_1 = _a ^ _b;
    assign _sum = xor_1 ^ _c_in;
    assign _c_out = xor_1 ? _c_in : _a;

endmodule

module rca
#(
    parameter BITS = 32
)
(
    input wire [BITS - 1:0] _a_in,
    input wire [BITS - 1:0] _b_in,
    input wire _c_in,
    output wire [BITS - 1:0] _s_out,
    output wire _c_out,
);
    wire [BITS:0] w_carry;
    assign w_carry[0] = _c_in;

    wire [BITS - 1:0] w_sum;

    genvar fa_loop;
    generate // Generate - instantiate a new module every time a module is invoked, doesn't delete the last
        for (fa_loop = 0; fa_loop < BITS; fa_loop++)
        begin
            fulladder_1bit fa_1(
                ._a(_a_in[fa_loop]),
                ._b(_b_in[fa_loop]),
                ._c_in(w_carry[fa_loop]),
                ._sum(w_sum[fa_loop]),
                ._c_out(w_carry[fa_loop + 1])
            );
        end
    endgenerate

    assign _s_out = w_sum;
    assign _c_out = w_carry[BITS];

endmodule