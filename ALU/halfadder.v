// halfadder.v
module halfadder(
    input  a,
    input  b,
    output sum,
    output carry
);

    // Versão "dataflow" (nível de abstração mais alto)
    assign sum = a ^ b;   // XOR
    assign carry = a & b; // AND

    /* // Versão "gate-level" (se você precisar usar portas explícitas)
    xor(sum, a, b);
    and(carry, a, b);
    */

endmodule