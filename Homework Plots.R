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
pdf(file="Homework_Plot1.pdf", width=4,height=4);
par(mfrow=c(1,1), mar=c(4, 4, 3, 2))
y <- log_sort_pvals
x <- log_exp_pvals
plot(x,y, xlab="-log10(expected P-value)", 
     ylab= "-log10(observed P-value)", col=1, pch=19)

#1h
abline(0,1, untf = FALSE, col=2, lwd=4, lty=2)

#2a
DiabetesDataFrame=read.table("pheno.sim.2014-1.txt",header=TRUE)
DiabetesMatrix=as.matrix(DiabetesDataFrame)

#2b
names(DiabetesDataFrame)
dim(DiabetesDataFrame)
DiabetesDataFrame$glucose_mmolperL
sort(DiabetesDataFrame$glucose_mmolperL) ->sort_DDF
sort_DDF[1:15]
controls <- c(3.595392, 3.991049, 4.137278, 4.285448, 4.297885, 4.304314, 4.374830, 4.395016, 4.423992, 
              4.429188, 4.437609, 4.458599, 4.504092, 4.567151, 4.600643)

#2c
sort_DDF[45:60]
cases <- c(7.337781,  7.406555,  7.438796,  7.589024,  7.594867,  7.640147,  7.642697,  7.741942,  7.803316,  
           7.908763,  7.958502, 7.971003,  8.454514,  8.979692,  9.452768, 10.357491)

#2d
pdf(file="Ploting_Homework_Question_#2_Graph.pdf", width=6,height=6); #open the file

par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) #sets plotting area and margins

plot(density(sort_DDF),col=2,lwd=4,xlab="Blood Glucose Levels", ylab="Frequency of Occurence",
     xlim=c(2,12),main="Distribution of Phenotypes")
abline(v=quantile(sort_DDF,0.75),lty=2,lwd=3,col=2)
abline(v=quantile(sort_DDF,0.25),lty=2,lwd=3,col=4)
dev.off()

#2e
head(rownames(snpsDataFrame))
snpsDataFrame["rs7584086_T",]
case_genotypes <- snpsDataFrame["rs7584086_T", c(2,8,9,22,24,27,28,34,44,48,49,50,53,54,60)]

#2f
head(rownames(snpsDataFrame))
snpsDataFrame["rs7584086_T",]
control_genotypes <- snpsDataFrame["rs7584086_T", c(5,10,11,12,14,15,16,23,26,29,38,42,45,46,57)]

#2g
table(snpsDataFrame, exclude = if(colnames !=c(2,8,9,22,24,27,28,34,44,48,49,50,53,54,60)
                                  &&snpsDataFrame[,1|2|3]==TRUE))

#2h
table(snpsDataFrame, exclude = if(colnames !=c(5,10,11,12,14,15,16,23,26,29,38,42,45,46,57)
&&snpsDataFrame[,1|2|3]==TRUE))
