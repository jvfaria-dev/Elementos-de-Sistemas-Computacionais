# Makefile para compilar e testar os componentes da ALU (Nand2Tetris)
# Baseado no Makefile fornecido pelo usuário.
# Usa Icarus Verilog (iverilog)

# Compilador e simulador
VERILOG = iverilog
VVP = vvp

# Lista de todos os componentes do projeto
COMPONENTS = halfadder fulladder add16 inc16 alu

# --- Dependências de Código Fonte ---
# Define os arquivos .v necessários para compilar cada módulo.
HA_SRC = halfadder.v
FA_SRC = fulladder.v $(HA_SRC)
ADD16_SRC = add16.v $(FA_SRC)
INC16_SRC = inc16.v $(ADD16_SRC)
ALU_SRC = alu.v $(ADD16_SRC)

# Arquivos de teste
TEST_OUTPUTS = $(patsubst %, test_%.out, $(COMPONENTS))
TEST_LOGS = $(patsubst %, test_%.log, $(COMPONENTS))

# Cores
GREEN = \033[0;32m
RED = \033[0;31m
BLUE = \033[0;34m
NC = \033[0[m

# Define todos os alvos que não são arquivos como "phony"
.PHONY: all test clean help test-basic-adders test-16bit-units test-alu-unit $(COMPONENTS)

# Alvo padrão: executa todos os testes
all: test

# Testa todos os componentes
test: $(COMPONENTS)
	@echo ""
	@echo "$(BLUE)=========================================$(NC)"
	@echo "$(GREEN)✅ Todos os testes da ALU foram executados!$(NC)"
	@echo "$(BLUE)=========================================$(NC)"

# --- Regras de Teste Específicas (para lidar com dependências) ---

halfadder:
	@echo "$(BLUE)Testando: $@$(NC)"
	@$(VERILOG) -o test_$@.out tb_$@.v $(HA_SRC)
	@$(VVP) test_$@.out > test_$@.log
	@cat test_$@.log
	@echo ""

fulladder:
	@echo "$(BLUE)Testando: $@$(NC)"
	@$(VERILOG) -o test_$@.out tb_$@.v $(FA_SRC)
	@$(VVP) test_$@.out > test_$@.log
	@cat test_$@.log
	@echo ""

add16:
	@echo "$(BLUE)Testando: $@$(NC)"
	@$(VERILOG) -o test_$@.out tb_$@.v $(ADD16_SRC)
	@$(VVP) test_$@.out > test_$@.log
	@cat test_$@.log
	@echo ""

inc16:
	@echo "$(BLUE)Testando: $@$(NC)"
	@$(VERILOG) -o test_$@.out tb_$@.v $(INC16_SRC)
	@$(VVP) test_$@.out > test_$@.log
	@cat test_$@.log
	@echo ""

alu:
	@echo "$(BLUE)Testando: $@$(NC)"
	@$(VERILOG) -o test_$@.out tb_$@.v $(ALU_SRC)
	@$(VVP) test_$@.out > test_$@.log
	@cat test_$@.log
	@echo ""

# --- Alvos de Teste Agrupados ---

# Testa apenas somadores básicos
test-basic-adders: halfadder fulladder
	@echo "$(GREEN)Somadores básicos testados$(NC)"

# Testa apenas unidades de 16 bits
test-16bit-units: add16 inc16
	@echo "$(GREEN)Unidades de 16 bits testadas$(NC)"

# Testa apenas a ALU
test-alu-unit: alu
	@echo "$(GREEN)ALU testada$(NC)"

# Limpa arquivos gerados
clean:
	@echo "$(BLUE)Limpando arquivos gerados...$(NC)"
	@rm -f $(TEST_OUTPUTS) $(TEST_LOGS)
	@rm -f *.vcd
	@echo "$(GREEN)Limpeza concluída$(NC)"

# Mostra ajuda
help:
	@echo "Makefile para testar componentes da ALU (Nand2Tetris)"
	@echo ""
	@echo "Uso:"
	@echo "  make               - Testa todos os componentes"
	@echo "  make test          - Testa todos os componentes"
	@echo "  make test-basic-adders - Testa HalfAdder e FullAdder"
	@echo "  make test-16bit-units - Testa Add16 e Inc16"
	@echo "  make test-alu-unit - Testa apenas a ALU"
	@echo "  make <componente>  - Testa um componente (ex: make alu)"
	@echo "  make clean         - Remove arquivos gerados"
	@echo "  make help          - Mostra esta ajuda"
	@echo ""
	@echo "Componentes disponíveis:"
	@echo "  $(COMPONENTS)"