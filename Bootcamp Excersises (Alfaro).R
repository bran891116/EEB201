#Bootcamp Excersises
#1
numbers <- c( 1, 2, 3, 4, 5, 6, 7, 8, 9)
for(ii in 1:length(numbers)){
  if(numbers[ii] <= 8){
    cat(numbers[ii], '', sep = '\n', fill = T)
  }
  else {cat(numbers[ii], '*', sep = '\t', fill = T)
  }
}

#2
numbers <- c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
for(ii in 1:length(numbers)){
    cat(numbers[ii], '*', sep = '&')
  }

#3
dogs <- 10;
for (i in 1:5){
  dogs <- dogs + 1; 
}
### starts as 10, subsequent iterations: 10+1=11, 11+1=12, 12+1=13,
### 13+1=14, 14+1=15
meatloaf <- 0; 
for (i in 5:9){
  meatloaf <- meatloaf - i + 1;
  cat(meatloaf) 
} 
### starts as 0, subsequent iterations: 0-5+1=-4, -4-6+1=-9, 
### -9-7+1=-15, -15-8+1=-22, -22-9+1=-30,
bubbles <- 12;
for (i in -1:-4){
  bubbles <- i;
}
### starts at 12, subsequent iterations: -1, -2, -3, -4

#4
###you can use the if statement with the modulus operator to conditionally perform operations
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
  }
  else {cat(years[ii], 'Hooray, presidential elections!', sep = '\t', fill = T)
    }
}

#5
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
compounded <- matrix(NA, nrow= 1, ncol= 6)

interestRate <- 0.0125;
for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }

#6
bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); #deduct
food<- c(3.5, 4.3, 5.0);    #deduct
fun <- c(7.8, 2.1, 10.5);  #deduct
#and incomes (through TAships) of 
income <- c(21, 21, 21); #add this
compoundedbankAccounts <- matrix(NA, nrow= 3, ncol= 6)
compoundedbankAccounts[1:3,1] <- bankAccounts

for (j in 1:5) {
  for (i in 1:length(bankAccounts)) {
    compoundedbankAccounts[i,j+1] <- (compoundedbankAccounts[i,j]-house[i]-food[i]-fun[i]+income[i])*
      interestRate+(compoundedbankAccounts[i,j]-house[i]-food[i]-fun[i]+income[i])
  }
}
print(compoundedbankAccounts)

#7
bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); #deduct
food<- c(3.5, 4.3, 5.0);    #deduct
fun <- c(7.8, 2.1, 10.5);  #deduct
years <- (2015:2020)
#and incomes (through TAships) of 
income <- c(21, 21, 21); #add this
compoundedbankAccounts <- matrix(NA, nrow= 3, ncol= 6)
compoundedbankAccounts[1:3,1] <- bankAccounts

rownames(compoundedbankAccounts) <- c("1","2","3")
colnames(compoundedbankAccounts) <- c("1","2","3", "4","5","6")

for (j in 1:5) {
  for (i in 1:length(bankAccounts)) {
    compoundedbankAccounts[i,j+1] <- (compoundedbankAccounts[i,j]-house[i]-food[i]-fun[i]+income[i])
   if(years[j]%%2==1 && i%%2==1){ 
        compoundedbankAccounts[i,j+1]=compoundedbankAccounts[i,j+1]+5
}
     compoundedbankAccounts[i, j+1] <- compoundedbankAccounts[i,j+1]*interestRate+compoundedbankAccounts[i,j+1]
  }
}
print(compoundedbankAccounts)

#8
xx <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19);
numberstring <- matrix(NA, nrow= 1, ncol= 17)
numberstring[1,1] <- 1

while(xx <= 17) {numberstring[i,j+1] <- numberstring[i,j]+xx[i]}

#9
nn <- seq(-3, 3, by = 0.5)
for(i in length(nn)){
if(nn[i] <= -1){
  nn[i] <- "small"
} else if(nn[i] >=1){
    nn[i] <- "big"
  } else {
    nn[i] <- "medium"
  }}