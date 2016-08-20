library(shiny)
library(stringr)
server <- function(input, output) {
     plotparams <- eventReactive(input$test, {
          # Reading in strings, email and threshold
          str <- c(str_to_lower(input$string1),str_to_lower(input$string2),str_to_lower(input$string3))
          email <- str_to_lower(input$email)
          thresh <- c(input$thresh1,input$thresh2,input$thresh3)
          # Counting occurences and testing for spam
          count <- c(str_count(email, str[1]),str_count(email, str[2]),str_count(email, str[3]))
          spam <- as.numeric(count >= thresh)
          list(count,spam,str)
     })
     output$plot <- renderPlot({
          barplot(plotparams()[[1]],
                  col=10*plotparams()[[2]],
                  names.arg=plotparams()[[3]],
                  main="String Frequency",
                  sub="red=above threshold")
     })
}