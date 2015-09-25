#4
install.packages("deSolve")
library(deSolve)

#example
expGrowthODE <- function(tt, yy, pars) {
  derivs <- pars['rr'] * yy
  return(list(derivs))
}

output <- lsoda(init, tseq, ODEfunction, pars)

init <- 1
tseq <- seq(0, 20, by=0.01)
pars <- c(rr = 0.1)

expGrowthOutput <- lsoda( init, tseq, expGrowthODE, pars)

head(expGrowthOutput)

plot(expGrowthOutput[,1], expGrowthOutput[,2], col='blue', type='l')

#4.1.1
library(deSolve)

expGrowthODE <- function(tt, NN, params) { 
  derivs <- params["rr"]*NN 
  return(list(derivs))   
}

init <- 1
tseq <- seq(from = 1, to = 20, by = 0.01)
parameters <- c(rr = 0.1)

pop_growth <- lsoda(init, tseq, expGrowthODE, parameters)
head(pop_growth)

plot(x = pop_growth[, 1], y = pop_growth[, 2], type = "l", lwd = 3,
     xlab = "time", ylab = "population")

#4.2.1
logGrowthODE <- function(tt, NN, params) { 
  derivs <- params["rr"]*NN*(1-(NN/params["kk"]))
  return(list(derivs))
}

init <- 10
tseq <- seq(from = 1, to = 125, by = 0.01)
parameters <- c(rr = 0.05, kk = 100)

log_pop_growth <- lsoda(init, tseq, logGrowthODE, parameters)
head(log_pop_growth)

plot(x = log_pop_growth[, 1], y = log_pop_growth[, 2], type = "l", lwd = 3, 
     xlab = "time", ylab = "population")