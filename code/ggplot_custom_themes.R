# Script for my preferred ggplot2 themes :)

theme_katy_grid <- function(base_size=14) {
  theme_classic(base_size=base_size) %+replace%
    theme(# Legend
      legend.title=element_text(size=rel(1)), legend.text=element_text(size=rel(.8)),
          #axes                      
          axis.text=element_text(size=rel(.8)),
          axis.title=element_text(size=rel(1)),
      # set margins (necessary for figure to not awkwardly overlap when using plot_grid in cowplot)
          plot.margin=unit(c(0.5, 0.5, 0.5, 0.5), "cm"))
}

theme_katy <- function(base_size=14) {
  theme_classic(base_size=base_size) %+replace%
    theme(# Legend
      legend.title=element_text(size=rel(1)), legend.text=element_text(size=rel(.8)),
      #axes                      
      axis.text=element_text(size=rel(.8)),
      axis.title=element_text(size=rel(1)))
}
