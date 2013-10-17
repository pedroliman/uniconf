library(shiny)
shinyUI(pageWithSidebar
  (
    headerPanel("ServPerf - Analise de Performance em Servicos"),
    
    sidebarPanel
    (
      helpText("Este aplicativo le um arquivo de dados e  a Análise de performance do servico.")
    ),
    
    mainPanel
    (
      tabsetPanel(
        # Upload ----
        tabPanel("Upload de Informacoes", 
                 helpText("Escolha um arquivo csv par atualizar o banco de dados com as suas informacoes. Os Registros constantes neste arquivo serao adicionados aos existentes."),
                 fileInput('arquivo', 'Escolha um arquivo CSV',
                           accept=c('text/csv', 'text/comma-separated-values,text/plain')),
                 #   tags$hr(),
                 checkboxInput('header', 'Primeira linha Ã© o titulo', TRUE),
                 
                 radioButtons('sep', 'Separador',
                              c(Virgula=',',
                                Ponto_e_virgula=';',
                                Tab='\t'),
                              'Comma'),
                 
                 radioButtons('quote', 'Quote',
                              c(None='',
                                'Double Quote'='"',
                                'Single Quote'="'"),
                              'Double Quote'),
                 
                 helpText("Apos fazer o upload do seu arquivo, abaixo voce vera seus 10 primeiros registros. Altere as opcoes de upload para ajustar a realidade do seus dados."),
                 helpText("Numero de Registros em seu arquivo:"),
                 tableOutput("tabela")
        ),
        # TabPanel com o Resumo dos Dados:
        tabPanel("Resumo", 
                helpText("Veja Abaixo o radar dos respondentes."),
                numericInput(inputId="respondentes",label="Mostrar os primeiros ... respondentes.",min=0,max=100,value=2),
                plotOutput("radar")
                 
                 )
        
    )
    )
  )
)