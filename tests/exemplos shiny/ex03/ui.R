library(shiny)
shinyUI(pageWithSidebar
  (
    headerPanel("Exemplo 3: Reatividade"),
    sidebarPanel
    (
      textInput(inputId="titulo", label="Titulo: ", value= "Resumo dos Dados"),
      selectInput(inputId="dataset", label= "Escolha um Conjunto de Dados: ", choices= c("Pedras", "Pressao", "Carros")),
      numericInput(inputId="numregistros", label="Numero de registros a visualizar: ", value= 10)
    ),
    
    mainPanel
    (
      #Mostrar o titulo e as outras informaçoes:
      h1("Titulo do Problema"),
      verbatimTextOutput("resumo"),
      tableOutput(outputId="tabela")
    )
  )
)