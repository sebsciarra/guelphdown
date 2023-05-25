#'  Generates résumé entries.
#'
#' @param orientation Whether to print figure on landscape or portrait page. Value should be either 'orientation', or 'portrait'.
#' @param samepage Whether to print figure on samepage or newpage.Value should be either 'samepage', or 'newpage'.
#' @param figure_bottom_margin Spacing between bottom of figure and footnote. Values can be specified in any type of LaTeX units,
#'  though centimeters (cm) are used by default.
#' @param figure_tag Tag used so that figure can be referenced using LaTex code (e.g., Figure \ref{fig:example-figure}).
#' @param image_ratio Ratio size of image.
#' @param figure_path path to figure
#' @param footnote footnote
#' @examples
#' create_apa7_figure(orientation = "landscape", samepage = T, figure_bottom_margin = "0cm",
#' title = "Depiction of Monte Carlo Method", figure_tag = "MonteCarlo-comparison", image_ratio = "0.7",
#' figure_path = "Figures/Monte_Carlo_comparison",
#' footnote = "Comparison of inferential approach with the Monte Carlo approach. The inferential
#' approach begins with a collected sample and then estimates the population parameter using an
#' appropriate statistical model. The difference between the estimated and population value can be
#' conceptualized as error. Because the population value is generally unknown in the inferential
#' approach, it cannot estimate how much error is introduced by any given methodological or statistical
#'  deficiency. To estimate how much error is introduced by any given methodological or statistical
#'  deficiency, the Monte Carlo method needs to be used, which constitutes four steps. The Monte Carlo method
#'  first defines a population by setting parameter values. Second, many samples are generated from the pre-defined
#'   population, with some methodological deficiency built in to each data set (in this case, each sample has a specific
#'    amount of missing data). Third, each generated sample is then analyzed and the population estimates of
#'    each statistical model are averaged and compared to the pre-determined parameter value. Fourth, the difference
#'    between the estimate average and the known population value defines the extent to which the missing data
#'    manipulation affected parameter estimation (the difference between the population and average estimated population
#'    value is the parameter bias).")
#' @returns A character vector
#' @export
create_apa7_figure <- function(orientation = '', samepage = T, figure_bottom_margin = '',
                               title, figure_tag, image_ratio, figure_path, footnote) {

  #optional arguments
  page_orientation <- ifelse(test = orientation == '', yes = '[landscape]', no = paste0('[', orientation, ']'))
  page_location <- ifelse(test = samepage == T, yes = '[samepage]', no = '[newpage]')
  figure_bottom_margin <- ifelse(test = figure_bottom_margin == '', yes = '[-0.4cm]', no = paste0('[', figure_bottom_margin, ']'))

  #LaTeX code for CV entry
  apaFigure_latex_code <- cat("\\begin{apaFigure}",
               page_orientation,
               page_location,
               figure_bottom_margin,
               '{', title, '}',
               '{', figure_tag, '}',
               '{', image_ratio, '}',
               '{', figure_path, '}',
               '{', footnote, '}',
               "\\end{apaFigure}", sep = '')

}

