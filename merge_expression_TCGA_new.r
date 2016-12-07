setwd("E://Shruti//Small Projects//TCGA//New folder//")


files<-read.csv("E://Shruti//Small Projects//TCGA//New folder//gdc_manifest_20161014_163716.txt",header=T,sep="\t")
expr<-data.frame(0)


for(i in 1:nrow(files)){
folder <- as.character(files[i,1])
#print(folder)
file_name <- as.character(files[i,2])
#print(file_name)

tag<- paste(folder,file_name,sep="\\")
x<-read.csv(tag,header=T,sep="\t",skip=1)
print(x[1:2,])

a<-as.vector(unlist(x[,2]))
expr<-cbind(expr,a)
gene<-x[,1]
}

final_expr<-data.frame(genes=data.frame(gene),expr)


write.table(final_expr,"E://Shruti//Small Projects//TCGA//final_exprexpr.txt",col.names=T,row.names=F,sep="\t")
