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
library(RDCOMClient) # Have to install.packages("RDCOMClient", repos = "http://www.omegahat.net/R")
library(tictoc)
####----Variables----####
# tab - master
# input
# title = c4
# change limits = c7
# base line lengh = c9
# dates = b26-284
# data = c26-284
vtemplateFile <- 'SPC Reporting Template.xlsx'
vworkingFile <- paste(getwd(), 'working.xlsx', sep= '/')

####----Data Access----####
df_exampleData <- read.csv('example_data.csv') %>%
  mutate(Date.Time = dmy(Date.Time))


####----Input Options & Data----####

rfl_load_spc_model_input <- function(data, templateFile, workingFile) {
  wb <- openxlsx::loadWorkbook(templateFile)
  writeData(wb, 1, data,  startRow = 26, startCol = 2,
            colNames= FALSE)
  saveWorkbook(wb, workingFile, overwrite = TRUE) 
  
  return(workingFile)
}

# rfl_load_spc_model_input(df_exampleData, vtemplateFile, vworkingFile)


####----Run SPC Excel Model----####

rfl_calculate_wb <- function(workingFile) {
  # Create COM Connection to Excel
  xlApp <- COMCreate("Excel.Application")
  xlApp[['Visible']] <- FALSE
  xlApp[['DisplayAlerts']] <- FALSE
  
  # Open workbook
  xlWB <- xlApp[["Workbooks"]]$Open(workingFile)
  xlWB$Save()
  xlWB$Close(TRUE) 
  
  return(workingFile)
}

# rfl_calculate_wb(paste(getwd(), workingFile, sep='/'))

####----Output Data for Chartting----####
# Get file
rfl_get_spc_model_output <- function(workingFile) {
  # Read working file
  df_output <- read.xlsx(workingFile, startRow = 25, 
                         detectDates = TRUE,
                         check.names = TRUE)
  
  # Remove working file
  file.remove(workingFile)
  
  # Filter for non-empty rows and important columns
  df_output %>%
    filter(!is.na(Date.Time)) %>%
    select(`Date.Time`, Value, Trajectory, Goal, Mean, Upper, Lower, Shift=Shift.1, Trend=Trend.1, Outlier) %>%
    mutate()
  
}

# df_output_tidy <- rfl_get_spc_model_output(vworkingFile)

####----Chart Data----####

rfl_spc_plot <- function(data, pointSize = 2, ...) {
  data %>%
    ggplot(aes(x = `Date.Time`)) +
    geom_ribbon(aes(ymin = Lower, ymax = Upper), fill = rfl_colour('blue', 0.3)) +
    geom_line(aes(y = Mean),
              color = 'black',
              linetype = 'dashed',
              size = 1) +
    geom_line(aes(y = Value)) +
    geom_point(aes(y = Value), size = pointSize) +
    geom_point(aes(y = Shift), fill = rfl_colour('pink'), size = pointSize) +
    geom_point(aes(y = Trend), fill = rfl_colour('yellow'), size = pointSize) +
    geom_point(aes(y = Outlier), fill = rfl_colour('orange'), size = pointSize) +
    labs(...) +
    rfl_style()
}

# rfl_spc_plot(df_output_tidy, title = "Example SPC Chart", subtitle = "Here is a subtitle")


ggRFLspc <- function(data, templateFile, workingFile, ...) {
  df_exampleData %>%
    rfl_load_spc_model_input(templateFile, workingFile) %>%
    rfl_calculate_wb %>%
    rfl_get_spc_model_output %>%
    rfl_spc_plot(...)
}

tic()
ggRFLspc(df_exampleData, vtemplateFile, vworkingFile, title = "Example SPC Chart", subtitle = "Here is a subtitle")
toc()