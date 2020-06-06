#Project Title: Standard Royal Free SPC chart
#File Title: run through example of what function needs to do
#Author: edward.watkinson (edward.watkinson@nhs.net)
#Team: Information Team RFL
#source: MAIN SOURCE FILE

####---- Libraries ----####

library(tidyverse)
library(lubridate)
library(openxlsx)
library(RFLtheme)

####----Variables----####
# tab - master
# input
# title = c4
# change limits = c7
# base line lengh = c9
# dates = b26-284
# data = c26-284
vtemplateFile <- 'SPC Reporting Template.xlsx'
vworkingFile <- 'working.xlsx'


####----Data Access----####
df_exampleData <- read.csv('example_data.csv') %>%
  mutate(Date.Time = dmy(Date.Time))

####----Input Options & Data----####
df_inputData <- df_exampleData

wb <- openxlsx::loadWorkbook(vtemplateFile)
writeData(wb, 1, df_inputData,  startRow = 26, startCol = 2,
          colNames= FALSE)
saveWorkbook(wb, vworkingFile, overwrite = TRUE)


####----Run SPC Excel Model----####

rfl_calculate_wb(paste(getwd(), vworkingFile, sep='/'))

####----Output Data for Chartting----####
# Get file
df_output <- read.xlsx(vworkingFile, startRow = 25, 
                       detectDates = TRUE,
                       check.names = TRUE)

df_output_tidy <- df_output %>%
  filter(!is.na(Date.Time)) %>%
  select(`Date.Time`, Value, Trajectory, Goal, Mean, Upper, Lower, Shift=Shift.1, Trend=Trend.1, Outlier) %>%
  mutate()

file.remove(vworkingFile)

####----Chart Data----####

vpointSize <- 2

df_output_tidy %>%
ggplot(aes(x=`Date.Time`)) +
  geom_ribbon(aes(ymin = Lower, ymax = Upper), fill=rfl_colour('blue', 0.3)) +
  geom_line(aes(y=Mean), color='black', linetype ='dashed', size=1) +
  geom_line(aes(y=Value)) +
  geom_point(aes(y=Value), size=vpointSize) +
  geom_point(aes(y=Shift), fill=rfl_colour('pink'), size=vpointSize) +
  geom_point(aes(y=Trend), fill=rfl_colour('yellow'), size=vpointSize) +
  geom_point(aes(y=Outlier), fill=rfl_colour('orange'), size=vpointSize) +
  rfl_style()

