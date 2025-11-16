// tb_inc16.v
`timescale 1ns / 1ps

module tb_inc16;

    // Entrada
    reg [15:0] in;

    // Saída
    wire [15:0] out;

    // Instancia a UUT
    // (Precisa compilar com inc16.v, add16.v, fulladder.v, halfadder.v)
    inc16 uut (
        .in(in),
        .out(out)
    );

    // Bloco de simulação
    initial begin
        $display("Iniciando teste: Inc16");
        $display("  in (decimal)  ||  out (decimal)");
        $display("----------------||----------------");
        $monitor("  %16d ||  %16d", $signed(in), $signed(out));

        // Caso 1: 0 -> 1
        in = 16'd0;  #10;

        // Caso 2: 1 -> 2
        in = 16'd1;  #10;

        // Caso 3: 15 -> 16
        in = 16'd15; #10;
        
        // Caso 4: -1 -> 0 (Teste de 'wrap-around' do complemento de dois)
        in = 16'sd-1; #10;
        
        // Caso 5: -2 -> -1
        in = 16'sd-2; #10;

        // Adicione mais casos de teste aqui...

        $display("Teste concluído.");
        $finish;
    end

endmodule