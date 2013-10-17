library(shiny)
shinyServer(function(input, output) 
{
  output$grafDistr <- renderPlot({
    distr <- rnorm(n=input$numobs,sd=input$desviop)
    hist(distr)
  })  
})