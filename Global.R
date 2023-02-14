#Libraries Used 
library(readr)
library(readxl)
library(dplyr)
library(magrittr)
library(DT)
library(plotly)
library(ggplot2)
library(ggtext)
library(corrplot)


#Import Dataset
salaries_data = read_csv("Dataset/salaries.csv")

#Structure of the data
salaries_data %>% 
  str()

#summary of the data
salaries_data %>% 
  summary()

