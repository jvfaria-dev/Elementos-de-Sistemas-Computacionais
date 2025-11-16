// alu.v
module alu(
    input  [15:0] x,
    input  [15:0] y,
    input  zx, // zera x
    input  nx, // nega x
    input  zy, // zera y
    input  ny, // nega y
    input  f,  // 1 para ADIÇÃO, 0 para AND
    input  no, // nega a saida
    
    output [15:0] out,
    output zr, // flag zero
    output ng  // flag negativo
);

    // --- Estágio 1: Pré-processamento das entradas ---

    // Processa X
    wire [15:0] x_z = (zx == 1) ? 16'b0 : x;
    wire [15:0] x_in = (nx == 1) ? ~x_z : x_z;

    // Processa Y
    wire [15:0] y_z = (zy == 1) ? 16'b0 : y;
    wire [15:0] y_in = (ny == 1) ? ~y_z : y_z;

    // --- Estágio 2: Operação (f) ---
    
    // Módulos que precisamos
    wire [15:0] add_out;
    wire [15:0] and_out;

    // Instancia o somador de 16 bits
    add16 adder_unit (.a(x_in), .b(y_in), .out(add_out));
    
    // A operação AND é bit-a-bit
    assign and_out = x_in & y_in;

    // Seleciona o resultado com base no bit 'f'
    wire [15:0] f_out = (f == 1) ? add_out : and_out;

    // --- Estágio 3: Pós-processamento da Saída (no) ---
    
    // O 'assign' final para a saída 'out'
    assign out = (no == 1) ? ~f_out : f_out;

    // --- Estágio 4: Flags ---
    
    // zr é 1 se a saída 'out' for exatamente 0
    assign zr = (out == 16'b0);
    
    // ng é 1 se a saída 'out' for negativa (bit mais significativo, [15], é 1)
    assign ng = out[15];

endmodule