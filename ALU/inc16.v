// inc16.v
module inc16(
    input  [15:0] in,
    output [15:0] out
);

    // Cria uma constante de 16 bits para o número 1
    wire [15:0] b_const = 16'b0000000000000001;

    // Reutiliza o add16 para fazer in + 1
    add16 incrementer (
        .a(in),
        .b(b_const),
        .out(out)
    );

endmodule