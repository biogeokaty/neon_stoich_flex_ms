# Function to spit out a dataframe of significance letters for comparison groups using the Tukey HSD
library(multcompView)

hsd_letters<-function(x, y){
  aov_out <- aov(y~x)
  hsd <- TukeyHSD(aov_out)
  hsd_frame <- data.frame(hsd["x"])
  sig <- hsd_frame %>%
    select(contains("p.adj")) %>%
    rename(p.adj = contains("p.adj")) %>%
    na.omit() %>%
    rownames_to_column(var="comparison") %>%
    mutate(is_sig = ifelse(p.adj<0.05, TRUE, FALSE))
  
  mult <- sig[,3]
  names(mult) <- sig$comparison
  
  data.frame(multcompLetters(mult)$Letters) %>%
    rownames_to_column(var="x") %>%
    rename(letters = multcompLetters.mult..Letters)
  
}