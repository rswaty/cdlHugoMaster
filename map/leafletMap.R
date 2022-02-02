
###### libraries
library(htmlwidgets)
library(leaflet)
library(RColorBrewer)
library(tidyverse)
library(RColorBrewer)

##### read in data 
projects <- read.csv("map/map3.csv", stringsAsFactors=F)


###### palette for dots-NOT USED CURRENTLY.  We may pick another "metric" for the palette in the future.
# pal <- colorNumeric(
#   palette = "Purples",
#   domain = projects$CompletionLevel
# )

projMap <- leaflet(projects) %>%
  addProviderTiles(providers$HERE) %>% 
  setView(-98.5795, 39.8283, zoom = 4)%>% 
  addCircleMarkers(~Longitude, ~Latitude, 
                   weight = 1, 
                   color = "black", 
                   radius=8, 
                   stroke = T,
                   fillOpacity = 0.7,
                   #fillColor = ~pal(projects$CompletionLevel),
                   fillColor = "#541569",
                   popup = paste('<strong>', "Project Name:",'</strong>',  projects$Project.Title, "<br><br>", "", 
                                 '<strong>', "Scientists:",'</strong>', projects$People, "<br><br>", "", 
                                 '<strong>',"Description:",'</strong>', projects$Description, "<br><br>", "")
                   ,) 



projMap

saveWidget(projMap, file="static/leaflet/CDLprojMap.html")

