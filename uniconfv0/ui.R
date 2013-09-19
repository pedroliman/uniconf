library(shiny)
shinyUI(pageWithSidebar
  (
    headerPanel("Uniconf - Confiabilidade Quantitativa"),
    
    sidebarPanel
    (
      helpText("Este aplicativo le um arquivo de dados e retorna a distribuicao weibull de maior aderencia aos dados. Na versao atual nao realizamos testes de aderencia.")
    ),
    
    mainPanel
    (
      tabsetPanel(
        # Upload ----
        tabPanel("Upload dos Dados", 
                 helpText("Insira seus dados em uma coluna do excel e salve com a extensao .csv. Somente depois, importe este arquivo."),
                 fileInput('arquivo', 'Escolha um arquivo CSV',
                           accept=c('text/csv', 'text/comma-separated-values,text/plain')),
              #   tags$hr(),
                 checkboxInput('header', 'Primeira linha é o titulo', TRUE),
                 
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
                 textOutput("numregistros"),
                 tableOutput("tabela")
                ),
        
        # Resumo dos Dados ----
        tabPanel("Resumo", 
                helpText("Veja abaixo o Tempo Médio ate a falha (MTTF), os Parâmetros Beta e Eta, e um histograma mostrando a distribuicao de seus dados."),
                verbatimTextOutput("informamttf"),
                verbatimTextOutput("beta"),
                verbatimTextOutput("eta"),
                plotOutput("histograma")
                # plotOutput("dispersao")
                 
                 ),
        
        tabPanel("Confiabilidade Weibull", 
                 helpText("O grafico abaixo mostra o comportamento da confiabilidade de acordo com a evolucao do tempo, assumindo aderencia a distribuicao weibull."),
                 plotOutput("confiabilidade"),
                 numericInput(inputId="tempo",label="Para este tempo...",min=0,max=10000,value=0),
                 helpText("A confiabilidade do equipamento sera de"),
                 textOutput("confiabilidadeestimada")
                 # plotOutput("dispersao")
                 
        )
        
#         , 
#         # Grafico  ----
#         tabPanel("Comportamento dos Dados", 
#                  helpText("Este app irá mostrar alguns conceitos de estatistica descritiva importantes. Utilize um arquivo com uma coluna de dados numericos.")
#                  )
    )
    )
  )
)