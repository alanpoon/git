library(shiny)
library(UsingR)
library(rCharts)
## need to put rChart library

shinyServer(
  function(input, output,session) {
    categories1<-row.names(mtcars)
    cat('length of categories1:',length(categories1))
    series2<-mtcars$qsec
    cat('length of series2:',length(series2))
    series3<-mtcars$wt
    cat('length of series3:',length(series3))
    output$myChart <- renderChart2({
    
      ## Example 2
      
      h1 <- Highcharts$new()
      
      h1$series(data = series2, dashStyle = "longdash",type = "spline")
      h1$series(data = series3, dashStyle = "shortdot",type = "column")
      h1$xAxis(title=list(text=input$x),categories=categories1)
      h1$legend(symbolWidth = 80)
      return(h1) 
    })
    
    observe({
      
      infile <- input$file1
     
      if (is.null(infile))
        return(NULL)
        d<-read.csv(infile$datapath, header=input$header, sep=input$sep, 
                       quote=input$quote)
  
      updateSelectInput(session, 'dropdown_1', choices = names(d))
      updateSelectInput(session, 'dropdown_2', choices = names(d))
      updateSelectInput(session, 'dropdown_3', choices = names(d))
      output$myChart <- renderChart2({
     
        ## Example 2
        categories1<-d[,input$dropdown_1]
        series2<-d[,input$dropdown_2]
        series3<-d[,input$dropdown_3]
        h1 <- Highcharts$new()
        
        h1$series(data = series2, dashStyle = "longdash",type = "spline")
        h1$series(data = series3, dashStyle = "shortdot",type = "column")
        h1$xAxis(title=list(text=input$x),categories=categories1)
        h1$legend(symbolWidth = 80)
        return(h1) 
      })
    })
    
  }
)