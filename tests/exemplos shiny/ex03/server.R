library(shiny)
library(datasets)

shinyServer(function(input, output) {
  
  inputDataset <- reactive ({
    # Vamos definir uma expressão reativa chamada EscolherDataset
    # Por torna-la reativa, vamos nos assegurar que:
    # 1) Ela só é chamada quando os inputs das quais ela depende
    # mudam
    # 2) O calculo dela e o seu resultado sao compartilhados
    # com todos os outros "callers", (ela só é executada uma única vez)
    # 3) Quando os inputs mudam e a expressao é reexecutada,
    # o novo resultado é comparado com o resultado anterior;
    # se os dois são iguais, então os callers nao são avisados.  
    switch(input$dataset,
            "Pedras" = rock,
            "Pressao" = pressure,
            "Carros" = cars)
  })
    
    output$titulo <- renderText ({
      # O output$titulo é computado de acordo com uma expressao
      # reativa que retorna o input$titulo. Quando o usuario muda
      # o campo "título":
      # 1) Esta expressão é automaticamente chamada para computar o output
      # 2) O novo titulo é empurrado para o browser para reexibição
      # 
      # NOtar que as expressoes reativas abaixo não dependem do
      # input$titulo, e por isso não são reexecutadas quando ele muda
      input$titulo
    })
    
    output$resumo <- renderPrint ({
      
      # O output$resumo depende do EscolherDataset() então
      # Ele vai ser reexecutado quando o datasetInput é reexecutado
      # Ou seja, quando input$dataset muda
      dados <- inputDataset()
      summary(dados)
    })
    
    output$tabela <- renderTable({
      
      # O output$tabela depende tanto da expressao reativa
      # EscolherDataset quanto do input$numregistros, então ele
      # vai ser reexecutado quando um dos dois mudar.
      head(x=inputDataset(),n=input$numregistros)
    })
  
})