library(shiny)
shinyUI(pageWithSidebar
  (
    headerPanel("ServPerf - Analise de Performance em Servicos"),
    
    sidebarPanel
    (
      helpText("Este aplicativo le um arquivo de dados e  a Análise de performance do servico.")
    ),
    
    mainPanel
    (
      tabsetPanel(
        tabPanel("Resumo", 
                helpText("Veja Abaixo o radar dos respondentes."),
                numericInput(inputId="respondentes",label="Mostrar os primeiros ... respondentes.",min=0,max=100,value=2),
                plotOutput("radar")
                 
                 )
    )
    )
  )
)