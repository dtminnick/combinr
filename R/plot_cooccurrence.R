
plot_cooccurrence <- function(observed) {
    
    # Expand each row into one row per NIGO type
    expanded <- observed %>%
        mutate(case_id = row_number()) %>%
        unnest(nigo_types)
    
    # Create pairwise combinations within each case
    pairs <- expanded %>%
        inner_join(expanded, by = "case_id") %>%
        filter(nigo_types.x < nigo_types.y) %>%
        count(nigo_types.x, nigo_types.y, name = "cooccurrence")
    
    ggplot(pairs, aes(x = nigo_types.x, y = nigo_types.y, fill = cooccurrence)) +
        geom_tile(color = "white") +
        scale_fill_gradient(low = "white", high = "steelblue") +
        labs(
            title = "NIGO Type Co-occurrence Heatmap",
            x = "NIGO Type",
            y = "NIGO Type",
            fill = "Count"
        ) +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
}
