library(statnet)
library(igraph)
library(matrix)
library(gplot2)
sample_data <- read.csv("PatientInfo_only_infected.csv", header = T,)
#create social network by edge list 
col1 <-data.frame(sample_data$patient_id)
col2 <-data.frame(sample_data$infected_by)
edgelist_df <- data.frame(col1, col2 )
edgelist_df1 <- na.omit(edgelist_df)
#to show adjacency martrix type 
el1 <- as.matrix(edgelist_df1)
el1[,1] <- as.character(el1[,1])
el1[,2] <- as.character(el1[,2])
g1=graph.edgelist(el1,directed = TRUE)
adjmatrix<-as_adjacency_matrix(g1, type = "both", names = TRUE, sparse = FALSE)
gplot(adjmatrix, displaylabels = FALSE, vertex.col = "green", edge.col = "red", label.pos = 1, 
      vertex.sides = 4, sizes(vertex.shapes()), 
      main = "SOCAIL NETWORK ANALYSIS FOR CORONA (infected patients by others) using adjacency matrix, TEAM #2")

