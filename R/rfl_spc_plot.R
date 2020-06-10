#' Plot the SPC chart
#'
#' Create SPC chart ggplot
#'
#' @param data data from rfl_get_spc_model_output
#' @param pointSize Size fo the alerts and geom_points
#' @param ... Variables sent to labs() for example title = "" and subtitle = "".
#' @return a ggplot SPC chart
#' @usage rfl_spc_plot(data)
 rfl_spc_plot <- function(data, pointSize = 2, ...) {

    ggplot2::ggplot(data, aes(x = `Date.Time`)) +
      ggplot2::geom_ribbon(ggplot2::aes(ymin = Lower, ymax = Upper), fill = RFLtheme::rfl_colour('blue', 0.3)) +
      ggplot2::geom_line(aes(y = Mean),
              color = 'black',
              linetype = 'dashed',
              size = 1) +
      ggplot2::geom_line(aes(y = Value)) +
      ggplot2::geom_point(aes(y = Value), size = pointSize) +
      ggplot2::geom_point(aes(y = Shift), fill = RFLtheme::rfl_colour('pink'), size = pointSize) +
      ggplot2::geom_point(aes(y = Trend), fill = RFLtheme::rfl_colour('yellow'), size = pointSize) +
      ggplot2::geom_point(aes(y = Outlier), fill = RFLtheme::rfl_colour('orange'), size = pointSize) +
      ggplot2::labs(...) +
    RFLtheme::rfl_style()
}
