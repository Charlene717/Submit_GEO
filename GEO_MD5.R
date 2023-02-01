## Extract MD5 from Folder_Hash_Report.log for GEO submit

##### Presetting ######
  rm(list = ls()) # Clean variable
  # memory.limit(150000)

##### Load Packages #####
#install.packages("tidyverse")  
  library(tidyverse)
  
##### Load Files #####
  MD5_Ori.df <-  read.delim("Folder_Hash_Report.log",sep = "\t",header = F)
  
  for(i in 1:((nrow(MD5_Ori.df)-1)/5)){
    if(i==1){
      MD5.df <- data.frame(file_name = MD5_Ori.df[i+1,],
                           file_checksum= MD5_Ori.df[i+3,])
    }else{
      MD5.df[i,"file_name"] <- MD5_Ori.df[(i-1)*5+2,]
      MD5.df[i,"file_checksum"] <- MD5_Ori.df[(i-1)*5+4,]
    }
  }
  rm(i)
  
##### Export Files #####  
  write.table( MD5.df ,
               file = paste0("file_checksum_MD5.tsv"),
               sep = "\t",
               quote = F,
               row.names = F
  )
  
  