library(shiny)
shinyServer(function(input, output) 
{

  # CarregaDados é uma expressao reativa que monta um dataframe
  # de acordo como input de dados do Usuário.
  CarregaDados <- reactive ({
    arquivodados <- input$arquivo
    if (is.null(arquivodados))
      return(NULL)
    read.csv(file=arquivodados$datapath, header=input$header, sep=input$sep, quote=input$quote)
    
  })  
  
  CalculaMttf <- reactive ({
    dados <- CarregaDados()
    mean(dados$Horas)
    
  })
  
  CalculaBeta <- reactive ({
    
    # Forumla do Beta que usei (tirei da planilha do marcos...)
    # Beta = count(dados-1) / sum ( ln(ultimo/xi) )
    dados <- CarregaDados()
    hfim <- as.numeric(tail(dados$Horas,n=1))
    dimensoes <- dim(dados)
    nfalhas <- as.numeric(dimensoes [1] - 1)
    ln <- log(hfim/head(dados$Horas,n=nfalhas))
    beta <- nfalhas / sum(ln)
    beta
    
  })
  
  CalculaEta <- reactive ({
    
    # Acho que isso aquiem baixo é gambiarra, testar para ver se é mesmo necessario chamar o calculbeta de novo ou nao
    beta <- CalculaBeta()
    eta <- hfim / (nfalhas^(1/beta))
    
  })
  
  output$tabela <- renderTable ({
    
    head(CarregaDados(),n=10)
    
  })

  output$numregistros <- renderText ({
    
    dimensoes <- dim(CarregaDados())
    dimensoes [1]
    
  })  
  
    output$histograma <- renderPlot({
    
    hist(CarregaDados()$Horas,col=12,xlab="Horas",ylab="Frequencia",main="Histograma")
    
  })
  
  output$confiabilidade <- renderPlot({
    
    dados <- CarregaDados()
    maximo <- max(dados$Horas)
    horas <- 0:maximo
    a <- 0:100
    perc <- a / 100
    probfalha<- pweibull(horas, beta, eta, lower.tail = TRUE, log.p = FALSE)
    conf <- 1- probfalha
    plot(conf,xlab="Horas",ylab="Confiabilidade",type="l", col=12)
    
    
  })
  
    output$informamttf <- renderText({
      media <- CalculaMttf()
      media
      
    })
  
  output$beta <- renderText({
    beta <- CalculaBeta()
    beta
    
  })

  output$eta <- renderText({
    eta <- CalculaEta()
    eta
    
  })
  
  output$confiabilidadeestimada <- renderText({
    beta <- CalculaBeta()
    eta <- CalculaEta()
    confiabilidadeestimada <- exp(-((input$tempo/eta)^beta))
    confiabilidadeestimada * 100
    
  })
  
})