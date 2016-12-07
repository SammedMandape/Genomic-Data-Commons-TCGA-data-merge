setwd("E:/Gladus/Breast Cancer/")

untar('AA_RNASeq_FPKM_gdc_download_20161207_172800.tar.gz')

files<-read.csv("E:/Gladus/Breast Cancer/MANIFEST.txt",header=T,sep="\t")
expr<-data.frame(0)


for(i in 1:nrow(files)){
#  use the following if folder name and file name are in 
#  seaprate columns
#  folder <- as.character(files[i,1])
#   #print(folder)
#  file_name <- as.character(files[i,2])
#   #print(file_name)

  file_name <- as.character(files[i,2])
# tag<- paste(folder,file_name,sep="\\")
# use tag instead of file_name if concatnating folder and file name
# in read.csv and skip=1 for microarray exp data.
  x<-read.csv(file_name,header=F,sep="\t")
# print(x[1:2,])

  a<-as.vector(unlist(x[,2]))
  expr<-cbind(expr,a)
# gene<-x[,1]
  }

final_expr<-data.frame(genes=x[,1],expr)


write.table(final_expr,"E:/Gladus/Breast Cancer/final_exprexpr.txt",col.names=T,row.names=F,sep="\t")
