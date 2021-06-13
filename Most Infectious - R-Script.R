library(statnet)
library(igraph)
library(matrix)
library(gplot2)
male_female <- read.csv("patients3.csv", header = T,)
#male_female <- read.csv("~/Documents/SocialNetwork/coronavirusdataset/PatientInfo9.csv", header = T,)
col1 <-data.frame(male_female$patient_id)
col2 <-data.frame(male_female$infected_by)
col3 <-data.frame(male_female$sex)
edgelist_df <- data.frame(col1, col2, col3)

summary(edgelist_df)
g <- graph_from_data_frame(edgelist_df, directed = FALSE)
color_g <- ifelse(edgelist_df$sample_data.sex == 'male', "red", "blue")
plot(g,
     vertex.color = ifelse(edgelist_df$male_female.sex == 'male', "blue", "red"),
     vertex.size = 3,
     vertex.label = NA,
     #vertex.label = ifelse(degree > 10, male_female$patient_id, NA),
     edge.arrow.size= .1,
     #vertex.label.degree=pi/4,
     vertex.label.color = "black",
     edge.size = 0.2, main="Social Network Structure of Corona in Korean (by gender)")
legend("topright", legend=c("male", "female"),
       col=c("red", "blue"), lty=1:2, cex=0.8)

