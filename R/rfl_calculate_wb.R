#' Open, evaluate and save the SPC working file
#' This function calcuates the values required for the SPC by opening, evaluating and saving the the SPC template in excel
#'
#' @param workingFile Path to working file wiht data loaded into it from rfl_load_spc_model_input
#' @return location of the workingFile with the SPC calculations complete
#' @usage rfl_calculate_wb('fileToCalculate.xlsx')
rfl_calculate_wb <- function(workingFile) {
  require("RDCOMClient") # not allowed usually but only works by doing this
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
