library(ggplot2)

download.file('https://zenodo.org/record/4527793/files/readlengths3.txt?download=1', destfile = 'readlengths3.txt')
newdata = read.csv('readlengths3.txt', sep=' ')

ggplot(newdata) + 
  geom_density(aes(x=readlength, fill=SampleID), alpha=0.2)

