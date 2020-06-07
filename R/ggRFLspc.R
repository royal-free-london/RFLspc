ggRFLspc <- function(data, templateFile, workingFile, ...) {
  df_exampleData %>%
    rfl_load_spc_model_input(templateFile, workingFile) %>%
    rfl_calculate_wb %>%
    rfl_get_spc_model_output %>%
    rfl_spc_plot(...)
}
