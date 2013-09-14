library(shiny)

# Definir a interface para o app
shinyUI(
  
  pageWithSidebar(
  
  # Nome da Aplicação ----
  headerPanel("Exercicio 1"),

  # Painel Lateral ----
  sidebarPanel(
    
    # Média de A
    numericInput(inputId="ia.media",label="Média da Var. A",value=45,min=0,max=1000,step=1),
    
    # Variancia de 
    sliderInput(inputId="ia.variancia",label="Variancia de A",value=600,min=0,max=1000,step=1)
    
    
    
    ),
  
  # Painel Principal ----
    # Enunciado do Problema:
    mainPanel(
    
      textOutput("resposta")
      
      
    )
  )
  )