ReturnGamResult <- function(model, coef, exponentiate = T) {
  categorise_pvalue <- function(p) {
    if (p < 0.001) {
      "<0.001"
    } else if (p < 0.01) {
      "<0.01"
    } else if (p < 0.05) {
      "<0.05"
    } else {
      paste0("=", round(p, 2)) # Not significant
    }
  }
  term <- model %>% tidy_gam(conf.int = TRUE, conf.level = 0.95, exponentiate = exponentiate) %>%
    filter(term == coef) %>%
    pull(estimate) %>%
    round(2)

  ci.low <- model %>% tidy_gam(conf.int = TRUE, conf.level = 0.95, exponentiate = exponentiate) %>%
    filter(term == coef) %>%
    pull(conf.low) %>%
    round(2)

  ci.high <- model %>% tidy_gam(conf.int = TRUE, conf.level = 0.95, exponentiate = exponentiate) %>%
    filter(term == coef) %>%
    pull(conf.high) %>%
    round(2)

  p.value <- categorise_pvalue(model %>% tidy_gam(conf.int = TRUE, conf.level = 0.95, exponentiate = exponentiate) %>%
                                 filter(term == coef) %>%
                                 pull(p.value) %>%
                                 round(4))

  if(grepl("^s\\(", coef)) {
    return(paste0("p", p.value))
  } else {
    result <- paste0(term, ", 95% CI ", ci.low, " to ", ci.high, ", p", p.value)
    return(result)
  }
}
