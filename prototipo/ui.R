################################################################################
# 27/08/2013 - Uniconf
# Criado por: Pedro Lima, 
# Definição: ui.R - Arquivo de Definição da Interface de usuario. Define a interface a ser
#            usada pelo pacote shiny para fazer o aplicativo funcionar.

library(shiny)

# Definição da Interface
shinyUI(pageWithSidebar(
  
  # Título da Aplicaçao
  headerPanel("Uniconf"),
  
  # Barra vertical que permanece ativa em todo app.
  # Conterá os passos que o usuario executou conforme a situação das variáveis.
  sidebarPanel(
    sliderInput("n", 
                "Number of observations:", 
                value = 500,
                min = 1, 
                max = 1000)
  ),
  
  # O Mainpanel contém em si o tabset que mostra uma série de informaçoes relevantes.
  mainPanel(
    tabsetPanel(
      tabPanel
      ("Upload", 
         # Colocar aqui uma lista dos registros recebidos no upload
         plotOutput("plot")
      ), 
      tabPanel
      (
        "Testes de Aderência",
        # Colocar aqui o resumo de cada um dos testes de aderência aplicados
        verbatimTextOutput("summary")
      ), 
      
      tabPanel
      (
        "Weibull",
        # Colocar aqui os gráficos da distribuiçao weibull e resultados de testes de aderência
       tableOutput("table")
       ),
      
      tabPanel
      (
        "Resultados",
        # Colocar aqui inputs para que o usuário defina o tempo e resgate a confiabilidade e vice-versa.
        tableOutput("table")
      )
    )
  )
))