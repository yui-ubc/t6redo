library(tidyverse)
library(palmerpenguins)

# Load and clean
data <- penguins %>% drop_na()

# Save
dir.create("data", showWarnings = FALSE)
write_rds(data, "data/01_clean_penguins.rds")
