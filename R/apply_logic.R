
apply_logic <- function(combos, rulebook) {
    
    combos %>%
        rowwise() %>%
        mutate(
            rules = list(rulebook[rulebook$nigo_type %in% nigo_types, ]),
            
            participant_followup = any(rules$requires_participant),
            sponsor_followup     = any(rules$requires_sponsor),
            
            override = (
                "Missing Sponsor Sig" %in% nigo_types &&
                    any(rules$requires_participant)
            ),
            
            participant_followup = ifelse(override, TRUE, participant_followup),
            sponsor_followup     = ifelse(override, FALSE, sponsor_followup),
            
            routing_notes = ifelse(override, "participant_override", "none")
        ) %>%
        ungroup() %>%
        select(-rules, -override)
}
