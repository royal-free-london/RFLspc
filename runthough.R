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

####----Data Access----####
wb <- openxlsx::loadWorkbook(vtemplateFile)
df_output <- read.xlsx(vtemplateFile, startRow = 25)
