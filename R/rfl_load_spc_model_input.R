#' Input data into SPC template
#'
#' This function loads data into the SPC template ready for calcualtion
#'
#' @param data data.frame consisting of only a date/time column in POSIXct format and a numerical column
#' @param templateFile Path to SPC Reporting Template file
#' @param workingFile Path to working file
#' @return location of the workingFile with the data loaded into it
#' @example rfl_load_spc_model_input(df_exampleData, 'SPC Reporting Template.xlsx', paste(getwd(), 'working.xlsx', sep= '/'))
rfl_load_spc_model_input <- function(data, templateFile, workingFile) {
  wb <- openxlsx::loadWorkbook(templateFile)
  openxlsx::writeData(wb, 1, data,  startRow = 26, startCol = 2,
            colNames= FALSE)
  openxlsx::saveWorkbook(wb, workingFile, overwrite = TRUE)

  return(workingFile)
}
