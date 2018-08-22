rm(list=ls())  
library(XML)
library(RCurl)
library(rlist)
require(tidyverse)
require(readxl)

new_df <- read_excel("/Users/Lukas/Desktop/Unterlagen/Work/Eigenes/FINALSODDS.xlsx",3)


colnames(new_df) <- c("Team", "probs")
new_df$probs <- as.numeric(new_df$probs)
calculate_probs <- function(bookmarkers){
  bookmarkers <- 1/as.numeric(str_replace_all(bookmarkers, ",", ".")) * 100
  
}

for(i in (colnames(new_df[,2:ncol(new_df)]))) {
  new_df[[i]] <- calculate_probs(new_df[[i]])
  
}


ggplot(new_df, aes(x = new_df$probs , fill = new_df$Team)) + 
  geom_density(alpha = 1) +
  labs(title = "World Champion Predictions - Before the finals", x = "Probabilities", y = "Frequency of Odds",
       fill = "Champion") + xlim(25,90) +scale_fill_manual(values=c("red","blue"))

