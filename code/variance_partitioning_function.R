# Function that takes a mixed linear model (only the one of the exact kind I'm using for my NEON analysis because I refuse to code anything more complex!) and spits out how much percent of the variance each random effect accounts for

library(lme4)
library(tidyverse)

pct_var_neon <- function(mod){
  temp1 <- data.frame(VarCorr(mod))
  temp2 <- temp1 %>%
    select(grp, vcov) %>%
    rename(group = grp,
           variance = vcov) %>%
    mutate(group = fct_recode(group, 
                              "species" = "species:(genus:family)",
                              "genus" = "genus:family",
                              "family" = "family",
                              "site" = "site_id",
                              "residual" = "Residual"))
  tot_var <- temp2 %>%
    summarize(sum_var = sum(variance))
  temp3 <- cbind(temp2, tot_var)
  
  temp3 %>%
    mutate(pct_var = (variance/sum_var)*100) %>%
    select(group, pct_var)
}
