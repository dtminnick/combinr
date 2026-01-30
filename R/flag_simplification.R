
flag_simplification <- function(master, rare_threshold = 1) {
    master %>%
        mutate(
            simplification_flag = case_when(
                observed_count == 0 ~ "theoretical_only",
                observed_count <= rare_threshold ~ "rare",
                TRUE ~ "common"
            )
        )
}
