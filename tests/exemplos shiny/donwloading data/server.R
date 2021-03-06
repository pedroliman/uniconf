library(shiny)
library(datasets)
shinyServer(function(input, output){
  
  datasetInput <- reactive ({
    switch(input$dataset,
           "Pedras" = rock,
           "Pressao" = pressure,
           "Carros" = cars)
  })
  
  output$tabela <- renderTable({
    datasetInput()
  })
  
  output$dadosdownload <- downloadHandler(
    # Aqui ele passa como parametro de texto o 
    #resultado de uma fun�ao. 
    filename=function(){paste(input$dataset,'asdad', '.csv', sep='')},
    # Aqui � como se ele criasse uma fun�ao aqui dentro
    #s� para gerar o arquivo. Por algum motivo ele
    #faz isso de uma forma diferente do que acima.
    content=function(arquivo) 
    {
    write.csv(datasetInput(), arquivo)
    }
    )  
})