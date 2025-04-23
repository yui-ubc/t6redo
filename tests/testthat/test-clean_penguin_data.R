test_that("clean_penguin_data removes NAs", {
  df <- tibble::tibble(
    a = c(1, 2, NA),
    b = c("x", "y", "z")
  )

  result <- clean_penguin_data(df)

  expect_equal(nrow(result), 2)
  expect_false(any(is.na(result)))
})
