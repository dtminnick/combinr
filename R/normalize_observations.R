
normalize_observations <- function(df, nigo_col = "nigo_types") {
    
    # Validate column exists
    if (!nigo_col %in% names(df)) {
        stop("Column '", nigo_col, "' not found in input data frame.")
    }
    
    # Validate list-column of character vectors
    if (!all(purrr::map_lgl(df[[nigo_col]], ~ is.character(.x)))) {
        stop("The nigo_types column must be a list-column of character vectors.")
    }
    
    df %>%
        # Normalize ordering so combinations collapse correctly
        mutate(
            nigo_types_sorted = purrr::map(
                .data[[nigo_col]],
                ~ sort(.x)
            ),
            combo_key = purrr::map_chr(
                nigo_types_sorted,
                ~ paste(.x, collapse = "_")
            )
        ) %>%
        
        # Collapse to unique combinations with counts
        count(combo_key, nigo_types_sorted, name = "observed_count") %>%
        
        # Rename sorted list to nigo_types (canonical version)
        rename(nigo_types = nigo_types_sorted)
}

