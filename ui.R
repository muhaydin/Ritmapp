library("shiny")
library("shinythemes")
library("shinyalert")
library("shinyWidgets")
library("readr")

ui <- fluidPage(theme=shinytheme("yeti"),
                setBackgroundImage(
                  src = "https://cdn.dribbble.com/users/2581393/screenshots/5685682/tree-loop-fox-motions-_portfolio_.gif"
                ),              
                titlePanel("RÝTM APP"),
                sidebarLayout(
                  sidebarPanel(
                    dateInput("date1", "Date:", Sys.Date()-2),
                    useShinyalert(),
                    actionButton("button1","Download Data", class = "btn-success"),
                    actionButton("button2","Show Data", class = "btn-success")
                    
                    
                  ),
                  mainPanel(
                    dataTableOutput("table1")
                  )
                )
                
)
