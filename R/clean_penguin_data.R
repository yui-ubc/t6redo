#' Clean Penguin Data
#'
#' Removes rows with missing values.
#'
#' @param data A data frame.
#' @return A data frame with missing values dropped.
#' @export
clean_penguin_data <- function(data) {
  data %>%
    drop_na()
}
