#1a

# Set working directory:
#change this to whatever you want
setwd("/Users/brandonmacdonald/GitHub/EEB201/data files/")

# Load a data set
snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld-1.txt',header=TRUE)

# Because the data are really just a large numeric matrix, we convert the dataframe to a matrix:
snps=as.matrix(snpsDataFrame)

compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}

chisqs=apply(snps,1,compute_chisquare)

# Compute p-values for each chi-square value using the pchisq function
pvals=pchisq(chisqs,1,lower.tail=FALSE)

#1b
mean(pvals<0.05) #0.04509218
mean(pvals<0.01) #0.01021425
mean(pvals<0.001) # 0.00124564

#1c
length(pvals) #4014
num_pval <- length(pvals)

#1d
exp_pval <- seq(1/num_pval,to=1, by=1/num_pval)
exp_pval

#1e
sort_pvals <- sort(pvals)

#1f
log_sort_pvals <- -log10(sort_pvals)
log_exp_pvals <- -log10(exp_pval)

#1g
pdf(file="Homework_Plot1.pdf", width=4,height=7);
par(mfrow=c(1,1), mar=c(4, 4, 3, 2))
y <- log_sort_pvals
x <- log_exp_pvals
plot(x,y, xlab="-log10(expected P-value)", 
     ylab= "-log10(observed P-value)", col=1, pch=19)
