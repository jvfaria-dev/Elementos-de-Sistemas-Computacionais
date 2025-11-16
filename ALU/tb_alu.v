// tb_alu.v
`timescale 1ns / 1ps

module tb_alu;

    // Entradas
    reg [15:0] x;
    reg [15:0] y;
    reg zx, nx, zy, ny, f, no;

    // Saídas
    wire [15:0] out;
    wire zr;
    wire ng;

    // Instancia a UUT
    // (Precisa compilar com alu.v, add16.v, fulladder.v, halfadder.v)
    alu uut (
        .x(x), .y(y),
        .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no),
        .out(out), .zr(zr), .ng(ng)
    );

    // Bloco de simulação
    initial begin
        $display("Iniciando teste: ALU Hack");
        $display("zx,nx,zy,ny,f,no |    x    |    y    ||   out   | zr | ng");
        $display("-----------------|---------|---------||---------|----|---");
        
        // Monitora as mudanças
        $monitor("      %b%b%b%b%b%b     | %7d | %7d || %7d | %b  | %b",
                  zx,nx,zy,ny,f,no, $signed(x), $signed(y), $signed(out), zr, ng);

        // Define valores de entrada padrão
        x = 16'd100; // Exemplo x
        y = 16'd50;  // Exemplo y

        // --- Teste das Funções ---

        // Teste 1: out = 0
        // zx=1, nx=0, zy=1, ny=0, f=1, no=0
        {zx,nx,zy,ny,f,no} = 6'b101010; #10;

        // Teste 2: out = 1
        // zx=1, nx=1, zy=1, ny=1, f=1, no=1
        {zx,nx,zy,ny,f,no} = 6'b111111; #10;

        // Teste 3: out = -1
        // zx=1, nx=1, zy=1, ny=0, f=1, no=0
        {zx,nx,zy,ny,f,no} = 6'b111010; #10;

        // Teste 4: out = x
        // zx=0, nx=0, zy=1, ny=1, f=0, no=0
        {zx,nx,zy,ny,f,no} = 6'b001100; #10;

        // Teste 5: out = y
        // zx=1, nx=1, zy=0, ny=0, f=0, no=0
        {zx,nx,zy,ny,f,no} = 6'b110000; #10;
        
        // Teste 6: out = !x (NOT x)
        // zx=0, nx=0, zy=1, ny=1, f=0, no=1
        {zx,nx,zy,ny,f,no} = 6'b001101; #10;

        // Teste 7: out = -x (complemento de dois)
        // zx=0, nx=0, zy=1, ny=1, f=1, no=1
        {zx,nx,zy,ny,f,no} = 6'b001111; #10;
        
        // Teste 8: out = x + y
        // zx=0, nx=0, zy=0, ny=0, f=1, no=0
        {zx,nx,zy,ny,f,no} = 6'b000010; #10;
        
        // Teste 9: out = x & y
        // zx=0, nx=0, zy=0, ny=0, f=0, no=0
        {zx,nx,zy,ny,f,no} = 6'b000000; #10;
        
        // Teste 10: out = x | y
        // zx=0, nx=1, zy=0, ny=1, f=0, no=1
        {zx,nx,zy,ny,f,no} = 6'b010101; #10;

        // --- Teste das Flags (zr, ng) ---
        
        // Teste 11: zr=1, ng=0 (saída 0)
        x = 16'd50; y = 16'sd-50;
        {zx,nx,zy,ny,f,no} = 6'b000010; // x + y
        #10;
        
        // Teste 12: zr=0, ng=1 (saída negativa)
        x = 16'd50; y = 16'sd-100;
        {zx,nx,zy,ny,f,no} = 6'b000010; // x + y
        #10;

        $display("Teste da ALU concluído.");
        $finish;
    end

endmodule