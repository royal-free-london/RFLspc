#have to install.packages("RDCOMClient", repos = "http://www.omegahat.net/R")
calculate_wb <- function(outputfile) {
  library(RDCOMClient)
  
  # Create COM Connection to Excel
  xlApp <- COMCreate("Excel.Application")
  xlApp[['Visible']] <- FALSE
  xlApp[['DisplayAlerts']] <- FALSE
  
  # Open workbook
  xlWB <- xlApp[["Workbooks"]]$Open(outputfile)
  xlWB$Save()
  xlWB$Close(TRUE) 
}
