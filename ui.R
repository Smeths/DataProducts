library(shiny)
ui <- fluidPage(
     headerPanel("eString - String Frequency for Spam Prediction"),
     sidebarPanel(
          textInput(inputId="email", label = "Enter Email Below:")
     ),
     mainPanel(
          p('Instructions:'),
          p('1, Paste email into text box on the left'),
          p('2, Set strings to be searched for with associated occurence threshold'),
          p('3, To see which strings and thresholds provide spam click the "test" button'),
          p('Red indicates the string frequency is over the threshold'), 
          inputPanel(
               textInput(inputId="string1", label = "Spam String"),
               textInput(inputId="thresh1", label = "Occurence Threshold")
          ),
          inputPanel(
               textInput(inputId="string2", label = "Spam String"),
               textInput(inputId="thresh2", label = "Occurence Threshold")
          ),
          inputPanel(
               textInput(inputId="string3", label = "Spam String"),
               textInput(inputId="thresh3", label = "Occurence Threshold")
          ),
          actionButton(inputId="test", label="Test"),
          plotOutput("plot")
     )
)