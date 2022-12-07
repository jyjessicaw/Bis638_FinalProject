
library(ggplot2)
library(magrittr)
library(dplyr)

view_icd = read.csv("view_icd.csv")
drugs2 = read.csv("drugs2.csv")

ggplot(view_icd, aes(y=reorder(subtype,n), 
               x=n, 
               fill=subtype,
               text=paste("n:",n))) + 
    geom_col() +
    theme_bw() +
    labs(y="Subtypes", x="Count", title="All MPneumonia Subtypes") + 
    theme(legend.position="none")

ggplot(view_icd, aes(y=reorder(subtype,n), 
                     x=n, 
                     fill=subtype,
                     text=paste("n:",n))) + 
    geom_col() +
    theme_bw() +
    labs(y="Subtypes", x="Count", title="All MPneumonia Subtypes") + 
    theme(legend.position="none")


drugs2 %>%
    arrange(desc(n)) %>%
    head(20) %>%
ggplot(aes(y=reorder(DRUG,n), 
                     x=n, 
                     fill=CLASS,
                     text=paste("n:",n))) + 
    geom_col() +
    theme_bw() +
    labs(y="Subtypes", x="Count", title="Top 20 Prescriptions") 
