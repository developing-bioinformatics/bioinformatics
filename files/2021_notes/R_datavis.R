# data vis with ggplot2!

census = read.csv('acs2017_county_data.csv') #check your PATH to this file
#census = read.csv('~/Downloads/acs2017_county_data.csv')
head(census)

library(ggplot2)
# ggplot format
# ggplot(*define dataset*) +
#     geom_point(mapping = aes(x=Men, y=Women)) # scatterplot

ggplot(data = census) +
  geom_point(mapping = aes(x = Men, y = Women))


# histogram
ggplot(data=census) +
  geom_histogram(aes(x=VotingAgeCitizen), binwidth = 500) +
  xlim(c(0,50000))

# area plot *similar to density plot (geom_density())
ggplot(data=census) +
  geom_area(stat='bin', bins=30, aes(x=VotingAgeCitizen)) +
  xlim(c(0,50000))


# Plotting discrete/categorical
ggplot(census) +
  geom_bar(aes(x=State))

# fix barplot
library(forcats) #install.packages('forcats')
ggplot(census) +
  geom_bar(aes(x=fct_infreq(State))) +
  theme(axis.text.x = element_text(angle=90)) +
  xlab('State')

# plotting two parameters (e.g., scatterplots)

# regular scatterplot
ggplot(census) +
  geom_point(aes(x=IncomePerCap, y=Poverty))

ggplot(census) +
  geom_point(aes(x=IncomePerCap, y=Poverty), alpha=0.1)

ggplot(census) +
  geom_point(aes(x=IncomePerCap, y=Poverty), alpha=0.1) +
  geom_smooth(aes(x=IncomePerCap, y = Poverty))

# hex plot
ggplot(census) +
  geom_hex(aes(x=IncomePerCap, y = Poverty))

# 2d density
ggplot(census) +
  geom_density2d(aes(x=IncomePerCap, y = Poverty))



