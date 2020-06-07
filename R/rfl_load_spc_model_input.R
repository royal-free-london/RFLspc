rfl_load_spc_model_input <- function(data, templateFile, workingFile) {
  wb <- openxlsx::loadWorkbook(templateFile)
  writeData(wb, 1, data,  startRow = 26, startCol = 2,
            colNames= FALSE)
  saveWorkbook(wb, workingFile, overwrite = TRUE)

  return(workingFile)
}
