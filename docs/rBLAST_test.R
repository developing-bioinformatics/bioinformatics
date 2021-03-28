library(rBLAST)
library(ggplot2)

download.file('https://raw.githubusercontent.com/developing-bioinformatics/bioinformatics/master/data/ctxAB.fasta',
              destfile='ctxAB.fasta')
download.file('ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Vibrio_cholerae/representative/GCF_000829215.1_ASM82921v1/GCF_000829215.1_ASM82921v1_genomic.fna.gz',
              destfile='vibrio_genome.fna.gz')
system('gunzip vibrio_genome.fna.gz')
query = readDNAStringSet('ctxAB.fasta')
db = readDNAStringSet('vibrio_genome.fna')

reference = 'vibrio_genome.fna'
makeblastdb(reference, dbtype = "nucl")

bl <- blast(db=reference, type='blastn')
#run
cl <- predict(bl, query)

ggplot(cl) +
  geom_density(aes(x=S.start)) +
  xlim(0, 2900000)

cl[1:5,]
