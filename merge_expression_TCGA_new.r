setwd("E:/Gladus/Pancreatic Cancer/African American")

untar('AA_RNASeq_FPKM_gdc_download_20170103_215648.tar.gz')

files<-read.csv("E:/Gladus/Pancreatic Cancer/African American/MANIFEST.txt",header=T,sep="\t")
expr<-data.frame(0)
colname <- vector()
expr<-expr[,-1]
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
  header <- as.character(files[i,1])
  colname <- c(colname, header)
  
  a <- as.vector(unlist(x[,2]))
  expr<-cbind(expr,a)
# gene<-x[,1]
  }


colnames(expr)<-colname
#genes <- x[,1]
final_expr<-data.frame(genes = x[,1],expr)


write.table(final_expr,"E:/Gladus/Pancreatic Cancer/African American/AA_pancreatic_final_expr.txt",col.names=T,row.names=F,sep="\t")
