library(tidymodels)
library(readr)

# Load
penguin_fit <- read_rds("data/03_fit.rds")
data_split <- read_rds("data/03_split.rds")

# Extract and check test data
test_data <- testing(data_split) %>%
  mutate(species = factor(species, levels = levels(training(data_split)$species)))

# Predict
predictions <- predict(penguin_fit, test_data, type = "class") %>%
  bind_cols(test_data)

# Confusion matrix
conf_mat_res <- conf_mat(predictions, truth = species, estimate = .pred_class)

# Save
write_rds(predictions, "data/04_predictions.rds")
write_rds(conf_mat_res, "data/04_confmat.rds")
