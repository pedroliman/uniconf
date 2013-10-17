library(shiny)
shinyUI(
  pageWithSidebar
  (
    headerPanel("Ex. 01: Gerador de Distribuicao Normal"),
    sidebarPanel(
      sliderInput(inputId="numobs", label="Num. de Observacoes", value= 500, max=1000, min= 1, animate=TRUE),
      sliderInput(inputId="desviop", label="Desvio Padrao", value= 1, max=5, min= 0, animate=TRUE)
    ),
    mainPanel(
      plotOutput("grafDistr")
    )
  )
)