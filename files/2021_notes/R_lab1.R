# write our code
version

x <- 2 # create variable called x and give a value of 2
class(x)
x+2

# other kinds of variables 
# sequence of values: vector ==> like a list of values
x <- seq(1, 10, 2) # x is a sequence from 1:10
print(x) # see what is in x
x[5] # access the first element in the list

# tables: data frame* and matrix objects
y <- matrix(nrow=5, ncol=5)
print(y)
class(y)

#index notation
y[1,1] # return the value in the first row and first column: y[row, col]
y[1,1] = 5
print(y[1,1])
print(y)

y[,1] = x
print(y[,1])
print(y)

# reading data files 
# reading text files (.txt, .csv, .tab) #export data as one of these
cars <- read.table('https://raw.githubusercontent.com/rsh249/bioinformatics/master/data/mtcars.csv', header=T, sep = ',') # Read a comma separated values file
print(cars)


write.table(cars, file='mtcars.tab') #like save
read.table(file='mtcars.tab')

#where is this file now???