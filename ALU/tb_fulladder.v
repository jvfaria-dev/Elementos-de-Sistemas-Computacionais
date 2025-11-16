// tb_fulladder.v
`timescale 1ns / 1ps

module tb_fulladder;

    // Entradas
    reg a;
    reg b;
    reg cin;

    // Saídas
    wire sum;
    wire carry;

    // Instancia a UUT
    // (Note que este tb_fulladder também precisa do halfadder.v para compilar)
    fulladder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    // Bloco de simulação
    initial begin
        $display("Iniciando teste: FullAdder");
        $display("a | b | cin || carry | sum");
        $display("--|---|-----||-------|---");
        
        // Loop para testar todas as 8 combinações
        integer i;
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i; // Atribui os 3 bits de 'i' para a, b, cin
            #10;
            $display("%b | %b | %b   || %b     | %b", a, b, cin, carry, sum);
        end

        $display("Teste concluído.");
        $finish;
    end

endmodule