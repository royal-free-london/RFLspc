#' create an SPC chart
#'
#' Create SPC chart from start to end
#'
#' @param data data.frame consisting of only a date/time column in POSIXct format and a numerical column
#' @param templateFile Path to SPC Reporting Template file
#' @param workingFile Path to working file
#' @param pointSize Size fo the alerts and geom_points
#' @param ... Variables sent to labs() for example title = "" and subtitle = "".
#' @return a ggplot SPC chart
#' @usage rfl_spc_plot(data, title='Data about Measure 1', subtitle='Collected at Hospital xxx 2018/19')
#' @export
ggRFLspc <- function(data, workingFile=tempfile(), pointSize=2, ...) {
  df_exampleData %>%
    rfl_load_spc_model_input(workingFile) %>%
    rfl_calculate_wb %>%
    rfl_get_spc_model_output %>%
    rfl_spc_plot(pointSize = pointSize, ...)
}
