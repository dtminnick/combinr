
plot_simplification <- function(master_flagged) {
    master_flagged %>%
        count(simplification_flag) %>%
        ggplot(aes(x = simplification_flag, y = n, fill = simplification_flag)) +
        geom_col() +
        labs(
            title = "Simplification Opportunity Categories",
            x = "Category",
            y = "Number of Combinations"
        ) +
        theme_minimal() +
        theme(legend.position = "none")
}
