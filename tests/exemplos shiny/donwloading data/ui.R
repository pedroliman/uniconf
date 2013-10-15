shinyUI(pageWithSidebar(
  headerPanel('Exemplo de Download'),
  sidebarPanel(
    selectInput(inputId="dataset",selected="Nenhum",label="Escolha um dataset:",choices = c("Nenhum","Pedras","Pressao","Carros")),
    checkboxInput("selecionado", "Selecionado"),
    conditionalPanel(condition= "input.selecionado == false ",
    downloadButton(outputId='dadosdownload',label="Download")
    )                 
  ),
  mainPanel(
    tableOutput('tabela')
  )
)
)