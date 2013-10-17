library(shiny)
library(RODBC)
library(fmsb)
shinyServer(function(input, output) 
{

  RetornaDados <- function () {
    con <- odbcConnect(dsn="teste")
    qry <- 
      "
    
    select
    10 as confiabilidade,
    10 as aspectostangiveis,
    10 as presteza,
    10 as seguranca
    from servperf limit 1
    
    UNION
    
    select
    0 as confiabilidade,
    0 as aspectostangiveis,
    0 as presteza,
    0 as seguranca
    
    from servperf limit 1
    
    union
    
    select
    (p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + p10)/10 as confiabilidade,
    (p11 + p12 + p13 + p14 + p15 + p16 + p17 + p18 + p19 + p20)/10 as aspectostangiveis,
    (p21 + p22 + p23 + p24 + p25 + p26 + p27 + p28 + p29 + p30)/10 as presteza,
    (p31 + p32 + p33 + p34 + p25 + p36 + p37 + p38 + p39 + p40)/10 as seguranca
    
    from servperf"
  dados <- sqlQuery(con,qry)
  close(con)
  dados

  
}

  FiltraDados <- reactive ({
    tabela <- head(x=RetornaDados(),n=input$respondentes + 2)
    tabela
  })
  
    output$radar <- renderPlot({
      radarchart(df=FiltraDados(),axistype=2,vlabels=c('Confiabilidade', 'Asp. Tangíveis                    ','Presteza','     Seg.'))
    
  })
  
})