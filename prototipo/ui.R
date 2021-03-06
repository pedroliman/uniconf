################################################################################
# 27/08/2013 - Uniconf
# Criado por: Pedro Lima, 
# Defini��o: ui.R - Arquivo de Defini��o da Interface de usuario. Define a interface a ser
#            usada pelo pacote shiny para fazer o aplicativo funcionar.

library(shiny)

# Defini��o da Interface
shinyUI(pageWithSidebar(
  
  # T�tulo da Aplica�ao
  headerPanel("Uniconf"),
  
  # Barra vertical que permanece ativa em todo app.
  # Conter� os passos que o usuario executou conforme a situa��o das vari�veis.
  sidebarPanel(
    sliderInput("n", 
                "Number of observations:", 
                value = 500,
                min = 1, 
                max = 1000)
  ),
  
  # O Mainpanel cont�m em si o tabset que mostra uma s�rie de informa�oes relevantes.
  mainPanel(
    tabsetPanel(
      tabPanel
      ("Upload", 
         # Colocar aqui uma lista dos registros recebidos no upload
         plotOutput("plot")
      ), 
      tabPanel
      (
        "Testes de Ader�ncia",
        # Colocar aqui o resumo de cada um dos testes de ader�ncia aplicados
        verbatimTextOutput("summary")
      ), 
      
      tabPanel
      (
        "Weibull",
        # Colocar aqui os gr�ficos da distribui�ao weibull e resultados de testes de ader�ncia
       tableOutput("table")
       ),
      
      tabPanel
      (
        "Resultados",
        # Colocar aqui inputs para que o usu�rio defina o tempo e resgate a confiabilidade e vice-versa.
        tableOutput("table")
      )
    )
  )
))