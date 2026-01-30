
library("dplyr")
library("ggplot2")
library("purrr")
library("tidyr")

source("./R/normalize_observations.R")
source("./R/apply_logic.R")
source("./R/flag_simplification.R")
source("./R/plot_cooccurrence.R")
source("./R/plot_combination_frequency.R")
source("./R/plot_routing_patterns.R")
source("./R/plot_simplification.R")

# Load rulebook.

rulebook <- readRDS("./data/sample_rulebook.rds")

# Load observations.

observed <- readRDS("./data/sample_observations.rds")

combinations <- normalize_observations(observed)

master <- apply_logic(combinations, rulebook)

master_flagged <- flag_simplification(master)

plot_cooccurrence(observed)

plot_combination_frequency(master)

plot_routing_patterns(master)

plot_simplification(master_flagged)
