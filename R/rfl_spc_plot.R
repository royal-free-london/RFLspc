rfl_spc_plot <- function(data, pointSize = 2, ...) {
  data %>%
    ggplot(aes(x = `Date.Time`)) +
    geom_ribbon(aes(ymin = Lower, ymax = Upper), fill = rfl_colour('blue', 0.3)) +
    geom_line(aes(y = Mean),
              color = 'black',
              linetype = 'dashed',
              size = 1) +
    geom_line(aes(y = Value)) +
    geom_point(aes(y = Value), size = pointSize) +
    geom_point(aes(y = Shift), fill = rfl_colour('pink'), size = pointSize) +
    geom_point(aes(y = Trend), fill = rfl_colour('yellow'), size = pointSize) +
    geom_point(aes(y = Outlier), fill = rfl_colour('orange'), size = pointSize) +
    labs(...) +
    rfl_style()
}
