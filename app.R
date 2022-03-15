library(shiny)
library(plotly)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(viridis)
library(RColorBrewer)
library(shinythemes)

library(RODBC)
channel<-odbcConnect("ORCL_DSN","system","orcl",believeNRows=FALSE)

garbage <- sqlQuery(channel, "
 SELECT *
 FROM
 GARBAGE")

local_govt<- sqlQuery(channel, "
 SELECT *
 FROM
 LOCAL_GOVT")


rec_and_cont<- sqlQuery(channel, "
 SELECT *
 FROM
 REC_AND_CONT")

odbcClose(channel)

total.collected<-select(rec_and_cont,REF_YEAR,GARBAGE_COLLECTED,RECYCLABLES_COLLECTED,ORGANICS_COLLECTED,TOTAL_COLLECTED,TOTAL_LANDFILL,CONTAMINATION_RATE)

total.collected<-tail(total.collected,-9)





ui <- fluidPage(
    
    # Application title
    # titlePanel("Garbage collection"),
    
    # Sidebar with a slider input for number of bins 
    box(radioButtons("pType", "Choose the metric to observe the yearly trend:", choiceNames=list('Total Waste', "Waste sent to Landfill","Contamination rate"),choiceValues=list('TOTAL_COLLECTED', "TOTAL_LANDFILL","CONTAMINATION_RATE"),inline = TRUE,selected = 'TOTAL_COLLECTED' ),plotlyOutput('vis1'),width = 12,align="center",height = 500)
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$vis1 <- renderPlotly({ 
        
        if (req(input$pType)=='TOTAL_COLLECTED') {
            
            p1<-total.collected%>%
                plot_ly(.)%>%
                add_trace(x = ~REF_YEAR, y = ~as.character(TOTAL_COLLECTED), type = 'bar', color = ~as.character(TOTAL_COLLECTED),colors ="Paired",showlegend =F)%>%
                add_trace(x = ~REF_YEAR, y = ~GARBAGE_COLLECTED, type = 'scatter', mode = 'lines',line = list(color = 'rgb(205, 12, 24)'),name='Garbage',showlegend =T,hoverinfo='none') %>%
                add_trace(x = ~REF_YEAR, y = ~RECYCLABLES_COLLECTED, type = 'scatter',  mode = 'lines', line = list(color = 'rgb(255, 255, 0)'),name='Recyclables',showlegend =T,hoverinfo='none') %>%
                add_trace(x = ~REF_YEAR, y = ~ORGANICS_COLLECTED, type = 'scatter',  mode = 'lines', line = list(color = 'rgb(0, 128, 0)'),name='Organics',showlegend =T,hoverinfo='none')%>%
                layout(xaxis = list(title = 'Year'), 
                       yaxis = list(title = 'Total waste collected (tonnes)'))
            
            
            p1
        }
        else if (req(input$pType)=='TOTAL_LANDFILL') {
            p2<-total.collected%>%
                plot_ly(.)%>%
                add_trace(x = ~REF_YEAR, y = ~as.character(TOTAL_LANDFILL),type = 'bar',color = ~TOTAL_LANDFILL,colors="Paired")%>%
                layout(xaxis = list(title = 'Year'), 
                       yaxis = list(title = 'Waste sent to landfill (tonnes)'),showlegend=F)
            
            
            p2
        }
        else {
            p3<-total.collected%>%
                plot_ly(.)%>%
                add_trace(x = ~REF_YEAR, y = ~CONTAMINATION_RATE, type = 'scatter', mode = 'lines',line = list(color = 'maroon'),showlegend=F)%>%layout(xaxis = list(title = 'Year'), 
                                                                                                                                                    yaxis = list(title = 'Contamination rate (%)'),showlegend =FALSE)
            
            p3
        }
        
        
    })
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
