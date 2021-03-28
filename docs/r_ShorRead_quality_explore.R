library(ShortRead)
library(ggplot2)

# cat SRA | xargs -p 3 -n 1 -I {} fastq-dump {}

fq1 = readFastq()
