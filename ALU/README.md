# Projeto da ALU (Unidade Lógica Aritmética) em Verilog

Este projeto implementa os componentes aritméticos e lógicos fundamentais para a construção de uma Unidade Lógica Aritmética (ALU) em Verilog, baseado no projeto 2 do curso Nand2Tetris.

## 📋 Conteúdo

### Somadores Básicos
- **halfadder.v** - Meio somador de 1 bit
- **fulladder.v** - Somador completo de 1 bit

### Componentes de 16 bits
- **add16.v** - Somador de dois números de 16 bits
- **inc16.v** - Incrementador de um número de 16 bits

### Unidade Central
- **alu.v** - Implementação da ALU Hack (com 6 bits de controle)

## 🧪 Test Benches

Cada componente possui um test bench correspondente com o prefixo `tb_`:
- `tb_halfadder.v`, `tb_fulladder.v`, `tb_add16.v`, etc.

Os test benches testam uma variedade de combinações de entradas e exibem os resultados para validação.

## 🛠️ Requisitos

- **Icarus Verilog** (iverilog) - Compilador Verilog
- **VVP** - Simulador Verilog (incluído com Icarus Verilog)

### Instalação

**Ubuntu/Debian:**
```bash
sudo apt-get install iverilog
