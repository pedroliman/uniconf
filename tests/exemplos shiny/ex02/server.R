library(shiny)
library(datasets)
shinyServer(function(input, output) 
{
  
  # Uso o switch para avaliar o input$dataset e trazer para a 
  # variável datasetEscolhido o dataset escolhido pelo usuario.
  EscolherDataset <- reactive ({
    switch(EXPR=input$dataset,
           "Pedras" = rock,
           "Pressao" = pressure,
           "Carros" = cars
           )
  })
  
  # Gerar um resumo do dataset
  output$resumo <- renderPrint ({
    dataset <- EscolherDataset()
    summary(dataset)
  })
  
  # MOstrar as primeiras "n" Observacoes
  output$tabela <- renderTable ({
    head(EscolherDataset(),n = input$numregistros)
    
  })
})