
library(dplyr)
library(purrr)
library(tidyr)

set.seed(123)

rulebook <- readRDS("./data/sample_rulebook.rds")

nigo_pool <- sample(rulebook$nigo_type, 30)

weights <- dnorm(seq(-3, 3, length.out = 30))

weights <- weights / sum(weights)

generate_observation <- function(id) {
    
    k <- sample(1:6, size = 1, prob = c(0.25, 0.25, 0.20, 0.15, 0.10, 0.05))
    
    selected <- sample(nigo_pool, size = k, replace = FALSE, prob = weights)
    
    data.frame(
        case_id = id,
        nigo_types = I(list(selected)),
        combo_key = paste(sort(selected), collapse = "_"),
        stringsAsFactors = FALSE
    )
}

observations <- map_df(1:10000, generate_observation)

saveRDS(observations, "./data/sample_observations.rds")
