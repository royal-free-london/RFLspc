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
