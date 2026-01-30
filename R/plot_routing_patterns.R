
plot_routing_patterns <- function(master) {
    master %>%
        mutate(pattern = case_when(
            participant_followup & sponsor_followup ~ "Participant + Sponsor",
            participant_followup ~ "Participant Only",
            sponsor_followup ~ "Sponsor Only",
            TRUE ~ "None"
        )) %>%
        count(pattern) %>%
        ggplot(aes(x = pattern, y = n, fill = pattern)) +
        geom_col() +
        labs(
            title = "Routing Pattern Distribution",
            x = "Routing Pattern",
            y = "Number of Combinations"
        ) +
        theme_minimal() +
        theme(legend.position = "none")
}
