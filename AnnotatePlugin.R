## ---- echo = FALSE, results = 'hide'---------------------------------------
library(knitr)
opts_chunk$set(error = FALSE)

## ----style, echo = FALSE, results = 'asis'---------------------------------
##BiocStyle::markdown()

## ---- message = FALSE------------------------------------------------------
library(SGSeq)


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
   sgfc_pred <- readRDS(paste(pfix, parameters["sg", 2], sep="/"))
   txf_ucsc <- readRDS(paste(pfix, parameters["tx", 2], sep="/"))
sgfc_pred <- annotate(sgfc_pred, txf_ucsc)
saveRDS(sgfc_pred, outputfile)
}
