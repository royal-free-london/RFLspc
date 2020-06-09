#' Input data into SPC template
#'
#' This function loads data into the SPC template ready for calcualtion
#'
#' @param data data.frame consisting of only a date/time column in POSIXct format and a numerical column
#' @param templateFile Path to SPC Reporting Template file
#' @param workingFile Path to working file
#' @return location of the workingFile with the data loaded into it
#' @usage rfl_load_spc_model_input(df_exampleData, tempfile())
rfl_load_spc_model_input <- function(data, workingFile) {

  openxlsx::writeData(RFLspc::savedTemplateFile, 1, data,  startRow = 26, startCol = 2,
            colNames= FALSE)
  openxlsx::saveWorkbook(RFLspc::savedTemplateFile, workingFile, overwrite = TRUE)

  return(workingFile)
}
