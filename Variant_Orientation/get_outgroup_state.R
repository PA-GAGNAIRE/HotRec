#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

#### TO RUN: Rscript --vanilla get_outgroup_state.R infile_name.txt outfile_name.txt 

# test if there is at least one argument: if not, return an error

if (length(args)==0)
  {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
  }
  else if (length(args)==1)
  {
  # default output file
  args[2] = "out.txt"
  }

# The program

OUT <- read.table(args[1], header=F)

get.out.pos = function(i)
  {
  if (OUT[i,9]<=100)
    {
    POS = as.vector(0)
    pos = which((strsplit(as.character(OUT[i,13]),split="")[[1]])=="-")
    site = 100-OUT[i,9]+1
    while (all(POS!=pos))
      {
      POS = pos[pos<=site]
      if (length(POS)>0)
        {
        SITE = site + length(POS)
        site = SITE
        pos = POS
        }
      else {pos=POS=0}
      }
    c(strsplit(as.character(OUT[i,13]),split="")[[1]][site],strsplit(as.character(OUT[i,14]),split="")[[1]][site])
    }
  else {c(NA,NA)}
  }

OUT_STATE = NULL
for(i in 1:1000)
  {OUT_STATE=rbind(OUT_STATE,get.out.pos(i))}

write.table(cbind(OUT,OUT_STATE), file=args[2], sep="\t", quote=F,col.names=F,row.names=F)

