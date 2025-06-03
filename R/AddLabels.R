#' This function takes a raw dataset, as read from the csv file and does basic cleaning
#' @import dplyr
#' @import icdpicr
#' @import stringr
#' @param data, a taft dataset
#' @param codebook, the taft codebook
#' @param columns_to_modify, a vector of column names to expand
#' @return data
#' @export
AddLabels <- function(data, codebook, columns_to_modify) {
  create_value_map <- function(variable_name) {
    codebook_row <- codebook %>%
      filter(name == variable_name)

    values <- strsplit(codebook_row$valid_values, ",")[[1]] %>% as.character()
    labels <- strsplit(codebook_row$value_labels, ",")[[1]] %>% str_trim() %>% str_remove_all("\"")

    setNames(labels, values)
  }

  vectorized_label_replace <- function(column_name, values) {
    value_map <- create_value_map(column_name)

    if (is.null(value_map) || length(value_map) == 0) {
      return(values)
    }

    map_chr(values, ~ifelse(.x %in% names(value_map), value_map[as.character(.x)], as.character(.x)))
  }

  tabledata <- data %>%
    mutate(across(all_of(columns_to_modify), ~vectorized_label_replace(cur_column(), .)))
  return(tabledata)
}
