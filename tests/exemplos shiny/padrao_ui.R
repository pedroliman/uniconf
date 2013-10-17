library(shiny)
shinyUI(pageWithSidebar
  (
    headerPanel("Nome do App."),
    # Quero colocar isso: "Esta pagina gera uma distribuicao randomica normal considerando o número de observacoes indicado na pagina."
    
    sidebarPanel
    (
      #Alguma coisa aqui.  
    ),
    
    mainPanel
    (
      #Alguma coisa aqui tambem.
    )
  )
)