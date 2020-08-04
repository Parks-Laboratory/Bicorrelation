library(reshape2)
library(stringr)
library(dplyr)
library(data.table)
library(WGCNA)

#Read in data
option = "FEMALE.txt"
apoE<-read.table(option,nrows = 23568)
apoE_mat<-as.matrix(apoE)
#Data cleaning
rownames(apoE_mat)<-apoE_mat[,8]
apoE_mat_num<-apply(t(apoE_mat[,-(1:8)]),2,as.numeric)
colnames(apoE_mat_num)<-rownames(apoE_mat)

#Calculate bicorrelations
bicor_apoE <- bicorAndPvalue(apoE_mat_num,alternative = "two.sided")

#Organize the output
Bicor<-melt(bicor_apoE$bicor)
p <- melt(bicor_apoE$p)
remove(bicor_apoE)
result <- Bicor
colnames(result) <- c("gene_name_1", "gene_name_2", "bicorrelation")
result <- data.frame(result)
result$p <- p$value
result <- result[result$p<0.1,]
result <- result[order(result$gene_name_2,partial = abs(result$bicorrelation),decreasing = T,na.last = T),]
remove(p)
remove(Bicor)

#Save the result
save(result,file = "2_apoE_FEMALE_bicorr.Rdata")

