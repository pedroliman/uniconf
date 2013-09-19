library(shiny)
shinyUI(pageWithSidebar
  (
    headerPanel("Nome do App."),
    # Quero colocar isso: "Esta pagina gera uma distribuicao randomica normal considerando o número de observacoes indicado na pagina."
    sidebarPanel
    (
      selectInput(inputId="dataset",label="Escolher Dataset", choices= c("Pedras", "Pressao", "Carros")),
      numericInput(inputId="numregistros", label="Num de registros a mostrar", value=15)
    ),
    
    mainPanel
    (
      verbatimTextOutput(outputId="resumo"),
      tableOutput(outputId="tabela")
    )
  )
)