library(shiny)

# Definir a interface para o app
shinyUI(
  
  pageWithSidebar(
  
  # Nome da Aplicação ----
  headerPanel("Exercicio 1"),

  # Painel Lateral ----
  sidebarPanel(
    
    # Média de A
    numericInput(inputId="ia.media",label="Media da Var. A",value=45,min=0,max=1000,step=1),
    
    # Variancia de 
    sliderInput(inputId="ia.variancia",label="Variancia de A",value=600,min=0,max=1000,step=1)
    
    
    
    ),
  
  # Painel Principal ----
    # Enunciado do Problema:
    mainPanel(
    
      "Uma determinada variavel A e observada e apresentou media igual a 45 u.m. e variancia igual
a 600 u.m.2. Uma outra variavel B apresentou as seguintes observacoes: 3, 1, 5 e 9. Comparando-as,
qual das duas apresenta maior variabilidade? Apresente os calculos que embasam sua resposta.",
      br(),
      tableOutput("tabela"),
      textOutput("resposta")
      
    )
  )
  )