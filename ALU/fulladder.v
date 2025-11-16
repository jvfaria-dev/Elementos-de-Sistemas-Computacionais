// fulladder.v
module fulladder(
    input  a,
    input  b,
    input  cin,
    output sum,
    output carry
);

    wire s1, c1, c2;

    // Instancia o primeiro halfadder para somar a e b
    halfadder ha1 (
        .a(a),
        .b(b),
        .sum(s1),
        .carry(c1)
    );

    // Instancia o segundo halfadder para somar o resultado anterior (s1) com o cin
    halfadder ha2 (
        .a(s1),
        .b(cin),
        .sum(sum),
        .carry(c2)
    );

    // O carry final é c1 OU c2
    assign carry = c1 | c2;

endmodule