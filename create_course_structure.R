# Script para criar a estrutura de diretórios do curso de avaliação de políticas públicas

base_dir <- "curso_avaliacao_r"

# Vetor com os nomes das pastas de cada módulo
folders <- c(
  "01_intro_r_rstudio",           # Introdução ao R e RStudio
  "02_limpeza_dados",             # Importação e limpeza de dados
  "03_fundamentos_avaliacao",     # Fundamentos teóricos da avaliação de políticas
  "04_estatistica_descritiva",    # Estatística descritiva e visualização
  "05_regressao_simples",         # Modelos de regressão linear simples
  "06_pareamento_rdd",            # Pareamento e Regressão Discontinuada
  "07_diff_in_diff",              # Diferenças em Diferenças (DiD)
  "08_analise_espacial",          # Análise espacial e desigualdades territoriais
  "09_relatorios_reprodutibilidade" # Relatórios e reprodutibilidade com RMarkdown
)

# Cria o diretório principal
if (!dir.exists(base_dir)) {
  dir.create(base_dir)
}

# Cria cada uma das pastas dos módulos
for (folder in folders) {
  dir.create(file.path(base_dir, folder), showWarnings = FALSE, recursive = TRUE)
}
