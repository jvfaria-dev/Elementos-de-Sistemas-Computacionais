// tb_halfadder.v
`timescale 1ns / 1ps

module tb_halfadder;

    // Entradas do teste (regs)
    reg a;
    reg b;

    // Saídas do teste (wires)
    wire sum;
    wire carry;

    // Instancia a Unidade Sob Teste (UUT)
    halfadder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Bloco de simulação
    initial begin
        $display("Iniciando teste: HalfAdder");
        $display("a | b || carry | sum");
        $display("--|---|-------|---");

        // Caso 1: 0 + 0
        a = 0; b = 0; #10;
        $display("%b | %b || %b     | %b", a, b, carry, sum);

        // Caso 2: 0 + 1
        a = 0; b = 1; #10;
        $display("%b | %b || %b     | %b", a, b, carry, sum);

        // Caso 3: 1 + 0
        a = 1; b = 0; #10;
        $display("%b | %b || %b     | %b", a, b, carry, sum);

        // Caso 4: 1 + 1
        a = 1; b = 1; #10;
        $display("%b | %b || %b     | %b", a, b, carry, sum);

        $display("Teste concluído.");
        $finish; // Termina a simulação
    end

endmodule