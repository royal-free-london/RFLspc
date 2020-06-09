#' Get data out of the SPC tempalate
#' This function loads the data back into R from the evaluated Excel SPC template
#'
#' @param workingFile Path to working file with data loaded into it and evaluated by rfl_calculate_wb
#' @return a data.frame including the original data and the calculated variables for the SPC chart
#' @example rfl_get_spc_model_output(paste(getwd(), 'working.xlsx', sep= '/'))
rfl_get_spc_model_output <- function(workingFile) {
  # Read working file
  df_output <- open.xlsx::read.xlsx(workingFile, startRow = 25,
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
