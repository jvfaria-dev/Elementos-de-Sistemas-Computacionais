// tb_add16.v
`timescale 1ns / 1ps

module tb_add16;

    // Entradas
    reg [15:0] a;
    reg [15:0] b;

    // Saída
    wire [15:0] out;

    // Instancia a UUT
    // (Precisa compilar com add16.v, fulladder.v, halfadder.v)
    add16 uut (
        .a(a),
        .b(b),
        .out(out)
    );

    // Bloco de simulação
    initial begin
        $display("Iniciando teste: Add16");
        $display("   a (decimal)   |    b (decimal)   ||   out (decimal)");
        $display("-----------------|------------------||-----------------");
        
        // $monitor é útil para vetores; ele imprime toda vez que um valor muda.
        // %d imprime em decimal.
        $monitor("   %16d |    %16d ||   %16d", $signed(a), $signed(b), $signed(out));

        // Caso 1: 0 + 0
        a = 16'd0;  b = 16'd0;  #10;

        // Caso 2: 1 + 1
        a = 16'd1;  b = 16'd1;  #10;

        // Caso 3: 10 + 20
        a = 16'd10; b = 16'd20; #10;
        
        // Caso 4: 5 + (-5) (Teste de complemento de dois)
        a = 16'd5;  b = 16'sd-5; #10; // 'sd' é para "signed decimal"

        // Caso 5: 100 + (-50)
        a = 16'd100; b = 16'sd-50; #10;
        
        // Caso 6: (-1) + 1
        a = 16'sd-1; b = 16'd1;  #10;

        // Caso 7: (-1) + (-1) = -2
        a = 16'sd-1; b = 16'sd-1; #10;
        
        // Adicione mais casos de teste aqui...

        $display("Teste concluído.");
        $finish;
    end

endmodule