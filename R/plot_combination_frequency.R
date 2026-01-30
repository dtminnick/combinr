
plot_combination_frequency <- function(master) {
    master %>%
        arrange(desc(observed_count)) %>%
        mutate(combo_key = factor(combo_key, levels = combo_key)) %>%
        ggplot(aes(x = combo_key, y = observed_count)) +
        geom_col(fill = "steelblue") +
        labs(
            title = "Frequency of Observed NIGO Combinations",
            x = "Combination",
            y = "Observed Count"
        ) +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 60, hjust = 1))
}
