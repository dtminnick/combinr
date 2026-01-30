
generate_combinations <- function(rulebook) {
    nigo_types <- rulebook$nigo_type
    
    map_df(1:length(nigo_types), function(k) {
        combn(nigo_types, k, simplify = FALSE) %>%
            map_df(~ data.frame(
                nigo_types = I(list(.x)),
                combo_key = paste(sort(.x), collapse = "_"),
                stringsAsFactors = FALSE
            ))
    })
}
