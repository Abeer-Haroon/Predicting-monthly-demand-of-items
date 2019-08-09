#r2d3library(shiny)
library(shinydashboard)
library(ggplot2)
devtools::install_github(repo = 'IBMDataScience/R4WML')
library(R4WML) 

library(zoo)
library(dplyr)
library(purrr)
library(rlang)
library(stringr)

library(DT)
library(r2d3)

library(nycflights13)

watson_ml_creds_url      <- 'https://us-south.ml.cloud.ibm.com'
watson_ml_creds_username <- '133ddbba-c129-4222-87e0-72eb4895c22c'
watson_ml_creds_password <- 'f7e651f7-d923-4e05-995b-40eec8e65a0d'

ml_endpoint.model        <- 'https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/bc54c8e4-e422-416a-8827-96325a0d898a/online'
watson_ml_creds_auth_headers <- get_wml_auth_headers(watson_ml_creds_url, watson_ml_creds_username, watson_ml_creds_password)
sales <- 500
title <- tags$a(href='https://www.ibm.com/uk-en/analytics/cloud-private-for-data',
                icon("yellow"),
                'The Data Store')

ui <- dashboardPage(
  #dashboardHeader(
  #  title = "The Data Store",
  #  titleWidth = 200
  
  
  # ),
  dashboardHeader(title = title),
  dashboardSidebar(
    
    
    selectInput("country", "Country:",
                list("USA", "UK", "Germany", "Australia", "UAE", "Spain"),selected = "UAE"
                
    ),
    selectInput("store", "Store number:",
                list("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"),selected = "1"
                
    ),
    
    radioButtons("radio", label = h3("Select the clothing item"),
                 choices =  c("T-shirts" = 1,
                              "Formal Shirts" = 2,
                              "Jeans" = 3,
                              "Formal Trousers" = 4,
                              "Blazers" = 5,
                              "Jackets" = 6,
                              "Shoes" =7,
                              "Heels" = 8
                 ),selected = 1),
    
    selectInput("size", "Size:",
                list("XS", "S", "M", "L", "XL", "XXL", "XXL"),selected = "M"
                
    ),
    # Copy the line below to make a date selector 
    dateInput("date", label = h5("Date"), value = "2018-01-01"),
    
    sidebarMenu(
      
      
      
    )
  ),
  dashboardBody(
    
    
    fluidRow(
      
      
      valueBoxOutput("ibox"),
      valueBoxOutput("vbox"),
      valueBoxOutput("wbox")
    ),
    
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom1.css")
    ),
    
    
    
    
    #  box(
    #  title = "Title 1", width = 4, solidHeader = TRUE, status = "primary" ,
    
    
    
    
    #  plotOutput("lineChart") ,
    
    box(
      width = 40,
      height = 510,
      title = "Monthly Demand Forecast for the Item", background = "black", solidHeader = TRUE,
      plotOutput("lineChart")
    ),
    fluidRow(
      img(src='shirt.png',  height = 150, weight = 150),
      img(src='hoodie.png', height = 150, weight = 150),
      img(src='jacket.png', height = 150, weight = 150),
      
      img(src='dress.png', height = 150, weight = 150),
      img(src='winter-hat.png', height = 150, weight = 150),
      img(src='shirt-2.png', height = 150, weight = 150),
      img(src='jeans.png', height = 150, weight = 150),
      img(src='sneakers.png', height = 150, weight = 150),
      img(src='hoodie.png', height = 150, weight = 150)
      
      
      
      
    ),
    
    
    mainPanel(
      
      
    )   
    
  )
)

server <- function(input, output, session) {
  
  output$lineChart <- renderPlot({  
    
    if (input$store == 1){
      if (input$radio == 1){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,526, ']]}')
        print(payload1)
        results <- wml_score(ml_endpoint.model, watson_ml_creds_auth_headers, payload1) }
      else if(input$radio == 2){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1297, ']]}')
        print(payload1)
        ml_endpoint.model2 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/7bbe9c93-4481-4674-9cd5-5b8032e8f2d6/online"
        results <- wml_score(ml_endpoint.model2, watson_ml_creds_auth_headers, payload1) }
      else if(input$radio == 3){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,845, ']]}')
        print(payload1)
        ml_endpoint.model3 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/5c3c1496-82b8-430b-b2d1-b84f52378604/online"
        results <- wml_score(ml_endpoint.model3, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 4){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,450, ']]}')
        print(payload1)
        ml_endpoint.model4 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/a354f7dc-ece5-42be-97e8-1ae85131d421/online"
        results <- wml_score(ml_endpoint.model4, watson_ml_creds_auth_headers, payload1) }
      else if(input$radio == 5){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,418, ']]}')
        print(payload1)
        ml_endpoint.model5 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/63db9d1a-abd4-4f13-8cc8-9c2f3b261404/online"
        results <- wml_score(ml_endpoint.model5, watson_ml_creds_auth_headers, payload1) }
      else if(input$radio == 6){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1427, ']]}')
        print(payload1)
        ml_endpoint.model6 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/0ab0fac7-2cf8-41c1-8b92-3c78cebb96c8/online"
        results <- wml_score(ml_endpoint.model6, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 7){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1330, ']]}')
        print(payload1)
        ml_endpoint.model7 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/78c57585-4ead-4cc3-bc07-0943d77aaee2/online"
        results <- wml_score(ml_endpoint.model7, watson_ml_creds_auth_headers, payload1) }
    }
    
    
    else if (input$store == 2){
      if (input$radio == 1){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,741, ']]}')
        print(payload1)
        ml_endpoint.model <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/967b05ca-08cb-4c26-82ea-070ce04872e3/online"
        results <- wml_score(ml_endpoint.model, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 2){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1900, ']]}')
        print(payload1)
        ml_endpoint.model2 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/c62e47e2-ec99-40c0-a373-3f85a77912f3/online"
        results <- wml_score(ml_endpoint.model2, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 3){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1230, ']]}')
        print(payload1)
        ml_endpoint.model3 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/f2a220af-7a43-4aed-8a3a-89bb34986b4b/online"
        results <- wml_score(ml_endpoint.model3, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 4){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,742, ']]}')
        print(payload1)
        ml_endpoint.model4 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/489916a5-0a84-4444-8137-3bfc90b10602/online"
        results <- wml_score(ml_endpoint.model4, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 5){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,639, ']]}')
        print(payload1)
        ml_endpoint.model5 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/622cff8d-d4aa-4351-9429-db4b635dabcf/online"
        results <- wml_score(ml_endpoint.model5, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 6){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1964, ']]}')
        print(payload1)
        ml_endpoint.model6 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/232a6029-0eef-4de6-9ec3-39fe739e488a/online"
        results <- wml_score(ml_endpoint.model6, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 7){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1953, ']]}')
        print(payload1)
        ml_endpoint.model7 <- "https://us-south.ml.cloud.ibm.com/v3/wml_instances/18dfe497-1e1f-4835-ab4c-8c46eea12e7c/deployments/aded1790-5706-4149-8833-42a59c693c88/online"
        results <- wml_score(ml_endpoint.model7, watson_ml_creds_auth_headers, payload1) }
    }
    
    
    
    print(results) 
    
    
    dataFrame <- results$values 
    
    print(dataFrame)
    
    df = as.data.frame(results$values)
    colnames(df) = results$fields 
    
    
    colnames(df)[6] <- "Sales"  
    
    temp <<- df 
    
    df[[1]] = as.POSIXct(df[[1]], format = "%Y-%m-%d %H:%M %p UTC", tz = "GMT")
    df = data.frame(lapply(df, function(x){
      if (class(x)[1] == "factor"){
        as.numeric(x)
      } else {
        x  
      }
    }))
    print(str(df))
    
    temp2 <<- df
    
    ggplot(df, aes(date, Sales)) +
      geom_line(color = "#00AFBB") +
      geom_point(color = "black")  #optional
    
    
    
  },height = 450, width = 1400)
  
  
  output$ibox <- renderValueBox({
    
    valueBox(
      paste0(4360 ), "Total demand for this year", icon = icon("credit-card"),
      color = "blue"
      
    )
    
  })
  
  output$vbox <- renderValueBox({
    valueBox(
      
      paste0(250), "Average Demand per item", icon = icon("table"),
      
    )
  })
  
  output$wbox <- renderValueBox({
    valueBox(
      paste0(25 , "%"), "Demand Increase", icon = icon("dollar"),
      color = "teal"
      
    )
  })
  
  
  
}

shinyApp(ui, server)
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

