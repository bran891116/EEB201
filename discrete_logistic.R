# 3.3 

NN <- 100
RR <- 1.05
ttmax <- 10
KK <- 180
NNmatrix <- matrix(NA, nrow= 1, ncol= ttmax+1)
NNmatrix [1] <- NN
for (tt in 1:ttmax) {
  NNmatrix[tt+1] <- (1+RR* (1-NNmatrix[tt]/KK)) *NNmatrix[tt]
}
plot(1:(ttmax+1), NNmatrix, xlab="time", ylab="N", type="b", col='blue')

# 3.3.1

discreteLogisticFun <- function(NN, RR, ttmax, KK) {
  NNmatrix <- matrix(NA, nrow= 1, ncol= ttmax+1)
  NNmatrix [1] <- NN
  for (tt in 1:ttmax) {
    NNmatrix[tt+1] <- (1+RR* (1-NNmatrix[tt]/KK))*NNmatrix[tt]
  }
  plot(1:(ttmax+1), NNmatrix, xlab="time", ylab="N", type="b", col='blue')
}

discreteLogisticFun(NN=10, RR=1.5, ttmax=10, KK=100)
# changing the value of RR changes the initial growth rate but it 
# still plateaus at KK

# 3.3.2
rdVec <- matrix(data = -0.3, 0.3, 1.3, 1.9, 2.2, 2.7, nrow= 1, ncol= 6)

par(mfrow = c(2,3))
for (ii in 1:length(rdVec)) {
  discreteLogisticFun(NN=10, RR=1.5, ttmax=10, KK=100)
}
