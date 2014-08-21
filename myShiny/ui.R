library(shiny)
shinyUI(fluidPage(sidebarLayout(
  sidebarPanel(
  titlePanel(
    "Questionnaire - Sandy"
    ),
  navlistPanel(
    "Basic Question",
    tabPanel("Question1",textOutput('question1'),textInput("a1",NULL,"QI"),submitButton("SUBMIT")),
    tabPanel("Question2",textOutput('question2'),numericInput("a2",NULL,3),submitButton("SUBMIT")),
    tabPanel("Question3",textOutput('question3'),textInput("a3",NULL,"22"),submitButton("SUBMIT")),
    "-----",
    "Favorite Question",
    tabPanel("Question4",textOutput('question4'),textInput("a4",NULL,"BLACK"),submitButton("SUBMIT")),
    tabPanel("Question5",textOutput('question5'),numericInput("a5",NULL,7),submitButton("SUBMIT")),
    tabPanel("Question6",textOutput('question6'),textInput("a6",NULL,"Chihuahua"),submitButton("SUBMIT"))   
  ),
  br()
  ),
  mainPanel(
    flowLayout(
    h3("Your answers"),img(src="pic2.png", height = 50, width = 50),img(src="pic3.png", height = 50, width = 50),
    img(src="pic4.png", height = 50, width = 50),img(src="pic5.png", height = 50, width = 50),
    img(src="pic6.png", height = 50, width = 50)
  ),
    br(),
    br(),
    fluidRow(
      column(2, textOutput("answer1")),
      column(3, textOutput("answer2")),
      column(2, textOutput("answer3"))    
    ),
    fluidRow(
      column(2, textOutput("answer4")),
      column(3, textOutput("answer5")),
      column(2, textOutput("answer6"))
      ),
    fluidRow(
      column(3,radioButtons("radio", label = h4("Gender"),
                            choices = list("Female" = 1, "Male" = 2,
                                           "None" = 3),selected = 3)),
      column(3,dateInput("date", 
                         label = h4("Birthday"), 
                         value = "2014-01-01"))
      ),
   
    fluidRow(
      column(3,
             dateRangeInput("dates", label = h4("Date range"))),
      
      column(3,
             fileInput("file", label = h4("File input")))
         
    ),
    fluidRow(
      column(3, 
             h4("TIP:"),
             helpText("Funny stuff")),
      
      column(3, offset = 5,
             numericInput("num", 
                          label = h4("Score me with 1-10"),
                          value = 1000))
      ),
  
  
  sidebarLayout(position = "right",
                
                sidebarPanel(
                  h4("Come on! Let's answer these questions!"),
                  h5("Hello!", a("Know more about Sandy!", href="http://www.linkedin.com/pub/meng-sandy-qi/80/18a/998"))
              
                ),
                mainPanel(
                  textOutput("result"),
                  img(src="pic.png", height = 100, width = 100),
                  plotOutput("map")
                )
  )
  )
  )
)
  )