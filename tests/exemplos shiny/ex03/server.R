library(shiny)
library(datasets)

shinyServer(function(input, output) {
  
  inputDataset <- reactive ({
    # Vamos definir uma express�o reativa chamada EscolherDataset
    # Por torna-la reativa, vamos nos assegurar que:
    # 1) Ela s� � chamada quando os inputs das quais ela depende
    # mudam
    # 2) O calculo dela e o seu resultado sao compartilhados
    # com todos os outros "callers", (ela s� � executada uma �nica vez)
    # 3) Quando os inputs mudam e a expressao � reexecutada,
    # o novo resultado � comparado com o resultado anterior;
    # se os dois s�o iguais, ent�o os callers nao s�o avisados.  
    switch(input$dataset,
            "Pedras" = rock,
            "Pressao" = pressure,
            "Carros" = cars)
  })
    
    output$titulo <- renderText ({
      # O output$titulo � computado de acordo com uma expressao
      # reativa que retorna o input$titulo. Quando o usuario muda
      # o campo "t�tulo":
      # 1) Esta express�o � automaticamente chamada para computar o output
      # 2) O novo titulo � empurrado para o browser para reexibi��o
      # 
      # NOtar que as expressoes reativas abaixo n�o dependem do
      # input$titulo, e por isso n�o s�o reexecutadas quando ele muda
      input$titulo
    })
    
    output$resumo <- renderPrint ({
      
      # O output$resumo depende do EscolherDataset() ent�o
      # Ele vai ser reexecutado quando o datasetInput � reexecutado
      # Ou seja, quando input$dataset muda
      dados <- inputDataset()
      summary(dados)
    })
    
    output$tabela <- renderTable({
      
      # O output$tabela depende tanto da expressao reativa
      # EscolherDataset quanto do input$numregistros, ent�o ele
      # vai ser reexecutado quando um dos dois mudar.
      head(x=inputDataset(),n=input$numregistros)
    })
  
})