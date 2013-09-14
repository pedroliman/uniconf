library(shiny)

shinyServer(function(input, output) {
  
  # Retorna as respostas de forma reativa usando o algoritmo que fiz antes:
  geraresposta <- reactive ({
    a.media <- input$ia.media
    a.variancia <- input$ia.variancia
    a.desviop <- sqrt(a.variancia)
    # Uma outra variável B apresentou as seguintes observações: 3, 1, 5 e 9.
    b.dados <- c(3,1,5,9)
    # Calculando medidas descriticas d b ----
    # Comparando-as, qual das duas apresenta maior variabilidade?
    # Somando vb:
    b.somadados <- sum(b.dados)
    # Resgatando n de vb:
    b.n <- as.numeric(length(b.dados))
    # Tirando a Média de vb:
    b.media <- b.somadados / b.n
    # Obtendo a variância de vb sem usar uma função já pré-moldada
    b.variancia <- sum((b.dados - b.media)^2)/(b.n - 1)
    b.desviop <- sqrt(b.variancia)
    # Calculando os coeficientes de Variação ----
    a.cv <- a.desviop / a.media
    b.cv <- b.desviop / b.media
    # Definindo o Resultado da questão ----
    if (a.cv > b.cv) {
      resposta <- "A Variável A tem Maior Variabilidade!"
    } else if (b.cv > a.cv){
      resposta <- "A Variável B tem Maior Variabilidade!"
    } else  {
      resposta <- "A variável B e a Variável A tem Variabilidades iguais!"
    }
    # Gerando a Resposta ------------------------------------------------------
    resposta
    
  })
  
  output$resposta <- renderText({
    geraresposta()
  })
  
})