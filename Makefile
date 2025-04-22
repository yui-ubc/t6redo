all: data/penguins_clean.rds data/train_data.rds output/confusion_matrix.rds figures/eda_boxplot.png

data/penguins_clean.rds: R/01_load_data.R
	Rscript R/01_load_data.R

data/train_data.rds: R/02_methods.R data/penguins_clean.rds
	Rscript R/02_methods.R

models/penguin_fit.rds: R/03_model.R data/train_data.rds
	Rscript R/03_model.R

output/confusion_matrix.rds: R/04_results.R models/penguin_fit.rds
	Rscript R/04_results.R

figures/eda_boxplot.png: R/02_methods.R data/penguins_clean.rds
	Rscript R/02_methods.R
