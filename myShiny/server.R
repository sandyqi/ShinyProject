library(shiny)
library(maps)
library(mapproj)
source("helpers.R")
countries <<- readRDS("D:/STUDY/DevelopingDataProducts/ASSIGNMENT/myShiny/data/counties.rds")
aa1 <<- "Your last name is "
shinyServer(
  function(input, output){
    calculate <- reactive({input$a2*234 + input$a5 * 100 +2.345})
    output$question1 <- renderText({"What is your last name"})
    output$question2 <- renderText({"What is the weekday today (from 1 - 7)"})
    output$question3 <- renderText({"What is the age of you?"})
    output$question4 <- renderText({"What is your favorite color?"})
    output$question5 <- renderText({"What is your lucky number? (from 0 - 9 )"})
    output$question6 <- renderText({"What is your favorite animal?"})
    output$answer1 <- renderText({paste("My last name is",input$a1)})
    output$answer2 <- renderText({paste("Today is ",input$a2)})
    output$answer3 <- renderText({paste("I am ",input$a3)})
    output$answer4 <- renderText({paste(input$a4," is so beautiful")})
    output$answer5 <- renderText({paste(input$a5," is my lucky number")})
    output$answer6 <- renderText({paste(input$a6," is so cute")})
    output$plot1 <- renderPlot({
      # Simply accessing input$goButton here makes this reactive
      # object take a dependency on it. That means when
      # input$goButton changes, this code will re-execute.
    
    })
    output$result <- renderText({
      if((input$a1 == "QI") && (input$a2 == 3) && (input$a3=="22")&&(input$a4=="BLACK")&&(input$a5==7)&&(input$a6=="Chihuahua"))
        "  Please change all of the default value"
      else {paste("Hi sweethear, ",input$a1, ". Today you will get ", calculate(), 
                  " dollars by chance. Your life is ", input$a4," In the future, you will live like a ",
      input$a6, " and have ",input$a5, "children.")}
    })
    output$map <- renderPlot({
      percent_map(counties$white, "darkgreen", "% white")
    })
  }
  )