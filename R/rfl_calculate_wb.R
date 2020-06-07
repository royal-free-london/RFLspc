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
