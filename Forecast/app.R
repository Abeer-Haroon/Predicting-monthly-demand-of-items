
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

watson_ml_creds_url      <- 'https://us-south.ml.cloud.ibm.com' #change if required
watson_ml_creds_username <- 'enter username'
watson_ml_creds_password <- 'enter password'

ml_endpoint.model        <- 'Enter the scoring endpoint for store 1 item 1'
watson_ml_creds_auth_headers <- get_wml_auth_headers(watson_ml_creds_url, watson_ml_creds_username, watson_ml_creds_password)
sales <- 500
title <- tags$a(href='https://www.ibm.com/uk-en/analytics/cloud-private-for-data',
                icon("yellow"),
                'Abys Closet')

ui <- dashboardPage(
  
  dashboardHeader(title = title),
  dashboardSidebar(
    
    
    selectInput("store", "Store number:",
                list("1", "2"),selected = "1"
                
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
    
    
    
    
    
    box(
      width = 40,
      height = 510,
      title = "Monthly Demand Forecast for the Item", background = "black", solidHeader = TRUE,
      plotOutput("lineChart")
    ),
    fluidRow(
      img(src='shirt.png',  height = 130, weight = 130),
      img(src='hoodie.png', height = 130, weight = 130),
      img(src='jacket.png', height = 130, weight = 130),
      
      img(src='dress.png', height = 130, weight = 130),
      img(src='winter-hat.png', height = 130, weight = 130),
      img(src='shirt-2.png', height = 130, weight = 130),
      img(src='jeans.png', height = 130, weight = 130),
      img(src='sneakers.png', height = 130, weight = 130),
      img(src='hoodie.png', height = 130, weight = 130)
      
      
      
      
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
        ml_endpoint.model2 <- "Enter the scoring endpoint for store 1 item 2"
        results <- wml_score(ml_endpoint.model2, watson_ml_creds_auth_headers, payload1) }
      else if(input$radio == 3){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,845, ']]}')
        print(payload1)
        ml_endpoint.model3 <- "Enter the scoring endpoint for store 1 item 3"
        results <- wml_score(ml_endpoint.model3, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 4){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,450, ']]}')
        print(payload1)
        ml_endpoint.model4 <- "Enter the scoring endpoint for store 1 item 4"
        results <- wml_score(ml_endpoint.model4, watson_ml_creds_auth_headers, payload1) }
      else if(input$radio == 5){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,418, ']]}')
        print(payload1)
        ml_endpoint.model5 <- "Enter the scoring endpoint for store 1 item 5"
        results <- wml_score(ml_endpoint.model5, watson_ml_creds_auth_headers, payload1) }
      else if(input$radio == 6){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1427, ']]}')
        print(payload1)
        ml_endpoint.model6 <- "Enter the scoring endpoint for store 1 item 6"
        results <- wml_score(ml_endpoint.model6, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 7){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1330, ']]}')
        print(payload1)
        ml_endpoint.model7 <- "Enter the scoring endpoint for store 1 item 7"
        results <- wml_score(ml_endpoint.model7, watson_ml_creds_auth_headers, payload1) }
    }
    
    
    else if (input$store == 2){
      if (input$radio == 1){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,741, ']]}')
        print(payload1)
        ml_endpoint.model <- "Enter the scoring endpoint for store 2 item 1"
        results <- wml_score(ml_endpoint.model, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 2){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1900, ']]}')
        print(payload1)
        ml_endpoint.model2 <- "Enter the scoring endpoint for store 2 item 2"
        results <- wml_score(ml_endpoint.model2, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 3){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1230, ']]}')
        print(payload1)
        ml_endpoint.model3 <- "Enter the scoring endpoint for store 2 item 3"
        results <- wml_score(ml_endpoint.model3, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 4){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,742, ']]}')
        print(payload1)
        ml_endpoint.model4 <- "Enter the scoring endpoint for store 2 item 4"
        results <- wml_score(ml_endpoint.model4, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 5){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,639, ']]}')
        print(payload1)
        ml_endpoint.model5 <- "Enter the scoring endpoint for store 2 item 5"
        results <- wml_score(ml_endpoint.model5, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 6){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1964, ']]}')
        print(payload1)
        ml_endpoint.model6 <- "Enter the scoring endpoint for store 2 item 6"
        results <- wml_score(ml_endpoint.model6, watson_ml_creds_auth_headers, payload1) }
      
      else if(input$radio == 7){
        payload1 <- paste0('{"fields":["date","store", "item","sales"],"values":[["',input$date, '",', input$store, ',', input$radio, ',' ,1953, ']]}')
        print(payload1)
        ml_endpoint.model7 <- "Enter the scoring endpoint for store 2 item 7"
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
    
    
    
  },height = 450, width = 1150)
  
  
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
