#=============================================================================================#
#Name: inna_plots.R
#Programmer: Inna Cohen
#Date Created: December 12, 2022
#=============================================================================================#
library(ggplot2)
library(magrittr)
library(dplyr)

setwd("C:/Users/12034/Documents/GitHub/Bis638_FinalProject/inna/")

#=========================================#
# CSV files were downloaded from sql queries 
#=========================================#
view_icd = read.csv("data/view_icd.csv")
drugs2 = read.csv("data/drugs2.csv")


#=========================================#
# Figure 2, Top 10 Pneumonia Subtypes
#=========================================#
view_icd %>% head(10) %>%
ggplot(aes(y=reorder(subtype,n), 
               x=n, 
               fill=subtype,
               text=paste("n:",n))) + 
    geom_col() +
    theme_bw() +
    labs(y="Subtypes", x="Count", title="Top 10 Pneumonia Subtypes") + 
    theme(legend.position="none")


#=========================================#
# Figure 3, Top 20 Prescriptions
#=========================================#
drugs2 %>%
    arrange(desc(n)) %>%
    head(20) %>%
ggplot(aes(y=reorder(DRUG,n), 
                     x=n, 
                     fill=CLASS,
                     text=paste("n:",n))) + 
    geom_col() +
    theme_bw() +
    labs(y="Prescription", x="Count", title="Top 20 Prescriptions") 
