getwd()
setwd("/Users/brandonmacdonald/GitHub/EEB201/data files")


# trying in class excersises

cat("hello world")
history()

tips <- c("learn R", "love R")
tips

# ls() can be used so you can remember what you called something. 
# it lists what you've assigned variables to

ls()
rm(list = ls(tips))

source("/Users/brandonmacdonald/GitHub/EEB201/data files/source.example.R")

all.I.know.about.life.I.learned.in.grad.school
all.I.know.about.life.I.learned.in.grad.school <- ("example function")
all.I.know.about.life.I.learned.in.grad.school()
"example function"

tt <- read.tree("tree.tre")
tt
dd <- read.table("data.txt")
dd
dd <- read.table("data.txt", header = T, as.is = T, sep = "\t")
dd
# as.is tells R to leave the information as it is, so it will keep
# character strings as characters instead to changing them into 
# factors, or tagging them as other kinds of data that could stop
# you from doing what you want to do

dim(dd)
#this told me the number of rows and columns
dflength <- dim(dd)[1]
dflength

?runif
#random uniform

size <- runif(92)
#this would be for adding another column to the data frame, with 92 
# roms deep, but if we add more rows or take away it won't work so...
size <- runif(dflength)
size

dd <- cbind(dd, size)
dd
# something about the cbind made R remember to include size in the dd

# == is a true or false questions to R

# \ means a new line

# For Loops
for (ii in 1:5) {cat("\nthe number is", ii)}
for(animal in notfish){cat(animal, "fish\n", sep="")}
notfish <- c("elephant")
#by default cat will put a space between those two words, so we put
# sep="" to set the seperation to no space

for(animal in notfish){cat(animal, "fish", " are tasty\n", sep="")}

# WHILE STATEMENTS
#while (SOME CONDITION is TRUE){ do something }

xx<-1
while(xx < 10) {
  xx <- xx+1;
  if (xx == 7) {
    cat(" lucky number ", xx, "\n") }
  else {
    cat("not excited about the number ", xx, "\n")
  }}
print(xx)

while(xx < 5) {
  xx <- xx+1; 
  if (xx == 3) {
    break; }
}
print(xx)

# LOGIC ARGUEMENTS

# | this is an or symbol
# & this works as an and in a logical statement
# ! this is NOT

# LOOPS

# for loops, uses a loop a fixed number of times
# go through the loop once for each value
# used the most

# use double letters for variables so they're easier to find
# and replace

#Calculate the numbers of all numbers from 1 to 20

sum(1:20)

# set values
RR <- 1.05
NN <- 100

#loop over 10 years
for(year in 1:10) {
  NN <- NN * RR
}
cat(NN)

?plot

# N is a STATE VARIABLE meaning it describes the state of the system
# R is a PERAMETER which describes how the processes are proceeding,
# of they are the rules to how things are changing

# character string followed by round brackets indicate to R that
# you want it to do a function
# character string followed by square brackets indicate indexing

#Bonus question make the code spit out the NN values for all of the
# years, 1 through 10

#need to make a vector to hold all of the values of NN, fill it with
  #NA values, and set the first on to 100

# set initial conditions and perameter values
NN <- 100
RR <- 1.05
ttmax <- 10

# initialize variable to a vector of NA values
# So I'm going to create a matrix that has all of my NN values
NNmatrix <- matrix(NA, nrow= 1, ncol= ttmax+1)
# I set my matrix called NNmatrix using the matrix function(NA refers
# to the data points that are going to be filled in with NA, row, 
# column *** ncol is set to TTmax+1 because we are starting at year
# 0 so there will actually be 11 NN values)

NNmatrix [1] <- NN
# now I've set the starting point to NN or 100. This is actually our
# year 0

#Now loop over the Tmax timesteps
for (tt in 1:ttmax) {
 NNmatrix[tt+1] <- RR*NNmatrix[tt]
 }

#plot the results
plot(1:(ttmax+1), NNmatrix, xlab="time", ylab="N", type="b", col='blue')

# 3.2.1 *Mini-exercise

