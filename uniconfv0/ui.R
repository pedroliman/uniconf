library(shiny)
shinyUI(pageWithSidebar
  (
    headerPanel("Confiabilidade Quantitativa"),
    sidebarPanel
    (width = 3,
      helpText("Este app le um arquivo de dados e retorna a distribuicao weibull de maior aderencia aos dados."),
      helpText("Sobre: Este app foi desenvolvido por Pedro Nascimento de Lima."),
      fileInput('arquivo', 'Escolha um arquivo CSV',
                accept=c('text/csv', 'text/comma-separated-values,text/plain'))
    ),
    
    mainPanel
    (width = 9,
      tabsetPanel(
        # Upload ----
        tabPanel("Conf. Upload dos Dados", 
                 helpText("Insira seus dados em uma coluna do excel e salve com a extensao .csv. Somente depois, importe este arquivo."),
                 
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
                fluidRow(
                  column(3,verbatimTextOutput("informamttf")),
                  column(3,verbatimTextOutput("beta")),
                  column(3,verbatimTextOutput("eta"))
                ),
                fluidRow(
                  column(6,plotOutput("histograma")),
                  column(6,
                         numericInput(inputId="tempo",label="Para este tempo...",min=0,max=2000,value=20),
                         helpText("A confiabilidade do equipamento sera de"),
                         textOutput("confiabilidadeestimada"))
                )
                
                # plotOutput("dispersao")
                 
                 ),
        
        tabPanel("Confiabilidade Weibull",
                 sliderInput("tempo_maximo", "Defina o tempo maximo do grafico",min=5,max=1000,value=200),
                 
                 fluidRow(
                   
                   column(4,
                          plotOutput("confiabilidade"),
                          helpText("O grafico acima mostra o comportamento da confiabilidade de acordo com a evolucao do tempo, assumindo aderencia a distribuicao weibull.")
                   ),
                   column(4,
                          plotOutput("probfalha"),
                          helpText("O grafico acima mostra a probabilidade de falha do equipamento.")
                   ),
                   column(4,
                          plotOutput("taxadefalha"),
                          helpText("O grafico abaixo mostra a densidade de falha do equipamento.")
                   )
                 )
                 
                 
        ),
        tabPanel("Teste de Aderencia",
                 fluidRow(
                   column(6,
                          plotOutput("graficosFit")
                          ),
                   column(6,
                          htmlOutput("statsFit")
                          )
                 )
        )
    )
    )
  )
)