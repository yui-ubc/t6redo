library(tidyverse)

# Load
data <- read_rds("data/01_clean_penguins.rds")

# Summary (optional, could save this too if needed)
summary_stats <- data %>%
  summarise(mean_bill_length = mean(bill_length_mm), mean_bill_depth = mean(bill_depth_mm))
print(summary_stats)

# Boxplot
plot <- ggplot(data, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  theme_minimal()

dir.create("figures", showWarnings = FALSE)
ggsave("figures/boxplot.png", plot)

# Prepare for modeling
data_model <- data %>%
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  mutate(species = as.factor(species))

# Save
write_rds(data_model, "data/02_model_ready.rds")
