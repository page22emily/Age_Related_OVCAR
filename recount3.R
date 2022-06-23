#Recount3 

library("recount3")

ovarian_recount3 <- recount3::create_rse_manual(
  project = "OV",
  project_home = "data_sources/tcga",
  organism = "human",
  annotation = "gencode_v26",
  type = "gene"
)


library(DESeq2)
library(tibble)
library(ggplot2)

dds <- DESeq(ovarian_recount3)