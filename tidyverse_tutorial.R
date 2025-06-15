# Tutorial básico do tidyverse em R

# Carregar o conjunto de pacotes
library(tidyverse)

# --------------------------------------------------------------------
# Manipulação de dados com dplyr
# --------------------------------------------------------------------

# Usaremos o conjunto de dados embutido 'iris'

data(iris)

# Visualizar as primeiras observações
head(iris)

# Estrutura das variáveis
glimpse(iris)

# Selecionar apenas algumas variáveis
iris_select <- iris %>%
  select(Sepal.Length, Sepal.Width, Species)

# Filtrar linhas específicas
iris_setosa <- iris %>%
  filter(Species == "setosa")

# Criar uma nova variável
iris_mut <- iris %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width)

# Resumir valores
resumo_iris <- iris %>%
  summarise(media_sepal_length = mean(Sepal.Length))

# Agrupar por espécie e resumir
resumo_especies <- iris %>%
  group_by(Species) %>%
  summarise(media = mean(Sepal.Length),
            desvio = sd(Sepal.Length))

# Ordenar valores
iris_ordenado <- iris %>%
  arrange(desc(Sepal.Length))

# --------------------------------------------------------------------
# Combinação de tabelas
# --------------------------------------------------------------------

# Tabelas de exemplo

df1 <- tibble(id = 1:3,
             valor = c("A", "B", "C"))

df2 <- tibble(id = c(1, 2, 4),
             descricao = c("um", "dois", "quatro"))

# Junção do tipo left join
df_left <- left_join(df1, df2, by = "id")

# --------------------------------------------------------------------
# Transformação de dados com tidyr
# --------------------------------------------------------------------

dados_largos <- tibble(
  id = 1:2,
  jan = c(2, 3),
  fev = c(5, 6)
)

# Converter para formato longo

dados_longos <- dados_largos %>%
  pivot_longer(cols = jan:fev,
               names_to = "mes",
               values_to = "valor")

# Voltar ao formato largo

dados_largos_novamente <- dados_longos %>%
  pivot_wider(names_from = mes,
              values_from = valor)

# --------------------------------------------------------------------
# Visualização de dados com ggplot2
# --------------------------------------------------------------------

# Gráfico de dispersão simples

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Comprimento vs. Largura das Sépala",
       x = "Comprimento da Sépala",
       y = "Largura da Sépala")

