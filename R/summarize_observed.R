
summarize_observed <- function(observed) {
    observed %>%
        count(combo_key, name = "observed_count")
}
