// add16.v
module add16(
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] out
);

    // Fio interno para conectar os carries (16 fios)
    wire [15:0] c;
    
    // O primeiro fulladder (bit 0) recebe cin = 0
    fulladder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0), // O primeiro carry-in é sempre 0
        .sum(out[0]),
        .carry(c[0])
    );

    // Loop de geração para os bits 1 a 15
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin: ripple_carry_loop
            fulladder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i-1]), // Carry-in vem do carry-out anterior
                .sum(out[i]),
                .carry(c[i])
            );
        end
    endgenerate

    // Nota: O carry-out final (c[15]) é descartado aqui, 
    // pois a saída 'out' tem apenas 16 bits.

endmodule