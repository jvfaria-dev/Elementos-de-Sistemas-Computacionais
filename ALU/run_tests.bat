@echo off
rem Script de teste para todos os módulos da ALU (Windows)

echo --- [1/5] Compilando e Testando HalfAdder ---
iverilog -o tb_halfadder tb_halfadder.v halfadder.v
vvp tb_halfadder
echo.

echo --- [2/5] Compilando e Testando FullAdder ---
iverilog -o tb_fulladder tb_fulladder.v fulladder.v halfadder.v
vvp tb_fulladder
echo.

echo --- [3/5] Compilando e Testando Add16 ---
iverilog -o tb_add16 tb_add16.v add16.v fulladder.v halfadder.v
vvp tb_add16
echo.

echo --- [4/5] Compilando e Testando Inc16 ---
rem O Inc16 depende de Add16, FullAdder e HalfAdder
iverilog -o tb_inc16 tb_inc16.v inc16.v add16.v fulladder.v halfadder.v
vvp tb_inc16
echo.

echo --- [5/5] Compilando e Testando ALU ---
rem A ALU depende de Add16, FullAdder e HalfAdder
iverilog -o tb_alu tb_alu.v alu.v add16.v fulladder.v halfadder.v
vvp tb_alu
echo.

echo --- Limpando arquivos compilados ---
del tb_halfadder tb_fulladder tb_add16 tb_inc16 tb_alu

echo Todos os testes foram concluidos!