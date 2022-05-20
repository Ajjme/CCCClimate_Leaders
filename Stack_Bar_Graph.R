#Stacked Bar graph 
library(tidyverse)
library(ggplot2)
library(plotly)
#library(rjson)
library(dplyr)
library(jsonlite)

Total_Scores_Data <- read.csv("Total_Scores_Data - Sheet1.csv", skip = 1, header = T)

Total_Scores <- Total_Scores_Data %>% select(#Climate.action.plan.Score, Green.House.Gas.Inventory.Score , Climate.Emergency.Score 
                                             #, General.Plan.with.Climate.Element.Score, 
  City, Solar.MW.Installed.Score , EV.Charging.Stations.Score 
                                             , MCE.Score, Electrification.Score, CivicSpark.Score)#, Green.Business.Score)

  
  Stacked_bar_graph <- plot_ly(Total_Scores, x = ~City, y = ~CivicSpark.Score, type = 'bar', name = 'Civic Spark',marker = list(color = 'grey')) %>%
  # add_trace(y = ~Green.House.Gas.Inventory.Score, name = 'Green House Gas Inventory') %>%
  # add_trace(y = ~Climate.Emergency.Score , name = 'Climate Emergency') %>%
  # add_trace(y = ~General.Plan.with.Climate.Element.Score, name = 'General Plan with Climate Element') %>%
  add_trace(y = ~Solar.MW.Installed.Score, name = 'Solar MW Installed',marker = list(color = 'lightgrey')) %>%
  add_trace(y = ~EV.Charging.Stations.Score, name = 'EV Charging Stations',marker = list(color = 'green')) %>%
  add_trace(y = ~MCE.Score, name = 'MCE',marker = list(color = 'darkgreen')) %>%
  add_trace(y = ~Electrification.Score, name = 'Electrification',marker = list(color = 'yellow')) %>%
  #add_trace(y = ~Green.Business.Score, name = 'Green Business', marker = list(color = 'blue')) %>%
  layout(xaxis = list(categoryorder = "total descending"))%>%
           layout(yaxis = list(title = 'Count'), barmode = 'stack')

  fig.update_layout(barmode='stack', xaxis={'categoryorder':'total descending'})
#filter already built in!!
Stacked_bar_graph
#library(htmlwidgets)
saveWidget(Stacked_bar_graph, file="Stacked_bar_graph_full.html")
