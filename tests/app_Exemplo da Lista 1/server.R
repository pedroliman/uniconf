library(shiny)

CalculaCV <- reactive ({
  
  dados <- x
  dados.soma <- sum(x)
  n <- as.numeric(length(dados))
  m <- dados.soma / n
  va <- sum((dados - m)^2)/(n - 1)
  dp <- sqrt(va)
  cv <- dp / m
  return(list(media=m, variancia=va, desviop=dp, n=n, cv=cv))
})

a.desviop <- 0
a.cv <- 0
b.media <- 0
b.variancia <- 0
b.desviop <- 0
b.n <- 0
b.cv <- 0

shinyServer(function(input, output) {
  
    # Retorna as respostas de forma reativa usando o algoritmo que fiz antes:

  geraresposta <- reactive ({
    a.desviop <- sqrt(input$ia.variancia)
    # Uma outra vari�vel B apresentou as seguintes observa��es: 3, 1, 5 e 9.
    b.dados <- c(3,1,5,9)
    # Calculando medidas descriticas d b ----
    # Comparando-as, qual das duas apresenta maior variabilidade?
    # Somando vb:
    b.n <- CalculaCV(b.dados)$n
    # Resgatando n de vb:
    # Tirando a M�dia de vb:
    b.media <- CalculaCV(b.dados)$media
    # Obtendo a vari�ncia de vb sem usar uma fun��o j� pr�-moldada
    b.variancia <- CalculaCV(b.dados)$variancia
    b.desviop <- CalculaCV(b.dados)$desviop
    # Calculando os coeficientes de Varia��o ----
    a.cv <- a.desviop / input$ia.media
    b.cv <- b.desviop / b.media
    # Definindo o Resultado da quest�o ----
    if (a.cv > b.cv) {
      resposta <- "A Vari�vel A tem Maior Variabilidade!"
    } else if (b.cv > a.cv){
      resposta <- "A Vari�vel B tem Maior Variabilidade!"
    } else  {
      resposta <- "A vari�vel B e a Vari�vel A tem Variabilidades iguais!"
    }
    # Gerando a Resposta ------------------------------------------------------
    resposta
    
  })
  
  dados <- reactive ({
    
    
    data.frame(
      
      Nome = c(
        "M�dia",
        "Vari�ncia",
        "Desvio Padrao",
        "n",
        "Coeficiente de Varia��o"
        ),
      
      ValoresA = as.character
      (c
       (
        input$ia.media,
        input$ia.variancia,
        a.desviop,
        "N/A",
        a.cv
        )
       ),
      
      ValoresB = as.character(c(
        b.media,
        b.variancia,
        b.desviop,
        b.n,
        b.cv
        )),
      stringsAsFactors=FALSE
      )
    
  })
  
  output$resposta <- renderText({
    geraresposta()
  })
  
  output$tabela <- renderTable({
    dados()
  })
  
})