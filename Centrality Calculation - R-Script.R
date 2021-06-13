library(statnet)
library(igraph)
library(tidyr)
#########Centrality calculation 
file1 <- read.csv("PatientInfo.csv", header = T,)
patients <-data.frame(file1$patient_id)
infected_by <-data.frame(file1$infected_by)
edgelist_df1 <- data.frame(patients, infected_by)
g1 <- graph_from_data_frame(edgelist_df1, directed = TRUE)
###to fine betweenness centrality 
bwtwnss <- betweenness(g1)
betweenness <- sort(bwtwnss, decreasing = TRUE)
head(sort(betweenness, decreasing = TRUE), n=5)
### find closeness centrality 
clns <- closeness(g1)
closeness <- sort(clns, decreasing = TRUE)
head(closeness, n=10)
#find degree centrallity 
dgr <- degree(g1)
degree <- dgr
###EIGENVECTOR
egnv <- eigen_centrality(g1)$vector
eigenvector <- egnv
head(eigenvector)
egn <- cbind(eigenvector)
###measures
centralities <- cbind("DEGREE CENTRALITY"=degree, "BETWEENNESS CENTRALITY"=betweenness, "ClOSENESS CENTRALITY"=closeness, "EIGENVECTGOR CENTRALITY"=eigenvector )
sort(centralities, decreasing = TRUE)
centralities
library(xlsx)
write.csv(centralities, file = "mtcars.csv")
head(centralities, n=20)

