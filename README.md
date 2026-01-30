# combinr

**combinr** is a lightweight, modular R package for analyzing combinations of NIGO (Not-In-Good-Order) issues, applying communication and routing rules, and surfacing operational complexity. It helps teams understand how NIGO types interact, how follow-up decisions are made, and where simplification opportunities exist.

The package is designed for workflows where:
- multiple NIGO types can occur together,
- routing logic depends on the *set* of issues present,
- some NIGO types override others,
- and automation requires a complete map of all possible combinations.

## Key Features

- **Generate all theoretical combinations** of NIGO types using tidy, reproducible functions.
- **Apply deterministic routing logic** (participant, sponsor, or override rules).
- **Join theoretical combinations with observed data** to quantify real-world variation.
- **Surface simplification opportunities** by identifying rare or unused combinations.
- **Produce analysis-ready tables** for automation validation, process redesign, or leadership reporting.

## Why combinr?

NIGO workflows often hide complexity in the *interactions* between issues, not the issues themselves. combinr makes that complexity visible by:

- treating NIGO types as sets,
- mapping every possible combination,
- applying rule logic consistently,
- and comparing theory to reality.

This gives you a defensible, data-driven foundation for:
- automation requirements,
- process simplification,
- and operational storytelling.

## Getting Started

```r
# install from GitHub (once published)
# remotes::install_github("yourusername/combinr")

library(combinr)

# load your rulebook
rulebook <- data.frame(
  nigo_type = c("Missing DOB", "Missing Address", "Missing Sponsor Sig", "Missing Phone"),
  requires_participant = c(TRUE, TRUE, FALSE, TRUE),
  requires_sponsor     = c(FALSE, FALSE, TRUE, FALSE),
  special_routing      = c("none", "none", "participant_override", "none"),
  stringsAsFactors = FALSE
)

# generate combinations
theoretical <- generate_combinations(rulebook)

# apply routing logic
logic <- apply_logic(theoretical, rulebook)

# join with observed data
observed <- your_observed_data
freq <- summarize_observed(observed)
master <- join_theoretical_observed(logic, freq)
