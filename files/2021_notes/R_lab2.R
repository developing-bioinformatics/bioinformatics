# Set up Palmers Penguins 
# installing library * gives us data

#install.packages('palmerpenguins') # download and install


library(palmerpenguins) # load the palmerpenguins library
data(package = 'palmerpenguins') # load data objects from palmerpenguins
head(penguins) # view the penguins data


# Read and write files
write.csv(penguins, file = 'penguins.csv') # write penguins.csv to local folder
penguins = read.csv('penguins.csv') # read penguins.csv

getwd()
list.files()

# example of how to move to a new folder
setwd('C:/Users/yk/Desktop/bioinformatics/bioinformatis_SP2021') # absolute path
setwd('./Desktop/bioinformatics/bioinformatics_SP2021') # relative path

# back to penguins
# try some plotting
plot(penguins) # try to plot a scatterplot for everything

plot(penguins[,5], penguins[,4]) # scatterplot
plot(penguins$bill_length_mm, penguins$bill_depth_mm) # scatterplot of bill length vs depth
plot(x=penguins[,'bill_length_mm'], y=penguins[,'bill_depth_mm'])

# other default plots
hist(penguins[,'bill_length_mm'])

boxplot(penguins[,'bill_length_mm'])
boxplot(penguins[,'bill_length_mm'] ~ penguins[,'species']) # boxplot bill length by species
boxplot(penguins[,'bill_length_mm'] ~ penguins[,'island']) 


# refine scatterplot with other functions of plot()
plot(x=penguins[,'bill_length_mm'], 
     y=penguins[,'bill_depth_mm'],
     col=as.factor(penguins[,'species'])) # add color by species
plot(x=penguins[,'bill_length_mm'], 
     y=penguins[,'bill_depth_mm'],
     col=as.factor(penguins[,'species']),
     pch = 20) # modify point markers

plot(x=penguins[,'bill_length_mm'], 
     y=penguins[,'bill_depth_mm'],
     col=as.factor(penguins[,'species']),
     pch = 20,
     xlab = 'Bill length (mm)',
     ylab = 'Bill depth (mm)') # clean up labels
legend('bottomright', 
       legend = unique(as.factor(penguins[,'species'])),
       pch=20,
       col = unique(as.factor(penguins[,'species'])))

