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
