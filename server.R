
library("shiny")
library("shinythemes")
library("shinyalert")
library("shinyWidgets")
library("readr")

server<-function(input,output){
  
  
  
  observeEvent(input$button1, {
    tarih <- as.character(format(input$date1, "%d%m%Y"))
    url = paste0("http://www.ritm.gov.tr/amline/data_file_ritm_",tarih,".txt")
    download.file(url, "file.txt" )
    df<-read.csv("file.txt", header=FALSE, stringsAsFactors=FALSE, sep = c(","," "))[-1,]
    colnames(df)<-c("DateTime","Q1","Q2","Q3","Q4","Fitted", "Actual")
    shinyalert("Downloaded!", "Related RÝTM estimations downloaded successfully.", type = "success")
    write.csv(df, "df_downloaded.csv", row.names=FALSE)
  })
  
  
  
  
  observeEvent(input$button2, {
    output$table1<-renderDataTable(extensions = c('Buttons'),
                                   class = 'cell-border stripe hover', rownames=F,
                                   filter="top", 
                                   options= list(dom = 'Bfrtip',
                                                 buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
                                                 pageLength=nrow(read.csv("df_downloaded.csv",sep=",")))
                                   ,
                                   read_csv("df_downloaded.csv", col_types = cols(DateTime = col_datetime(format = "%d.%m.%Y %H:%M")))
    )
    
  })

}
