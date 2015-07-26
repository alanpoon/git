library(rCharts) 
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Column and Line Chart"),
  sidebarPanel(selectInput(
    inputId = "x",
    label = "Choose X",
    choices = c('SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth'),
    selected = "SepalLength"
  ),    
  fileInput('file1', 'Choose CSV File',
                    accept=c('text/csv', 
                             'text/comma-separated-values,text/plain', 
                             '.csv')),
  tags$hr(),
  checkboxInput('header', 'Header', TRUE),
  radioButtons('sep', 'Separator',
               c(Comma=',',
                 Semicolon=';',
                 Tab='\t'),
               ','),
  radioButtons('quote', 'Quote',
               c(None='',
                 'Double Quote'='"',
                 'Single Quote'="'"),
               '"'),
  selectInput('dropdown_1', '', '',label="Choose Categories"),
  selectInput('dropdown_2', '', '',label="Choose Field for Line"),
  selectInput('dropdown_3', '', '',label="Choose Field for Column"),
  mainPanel(showOutput("myChart", "highcharts"))
  
))
)