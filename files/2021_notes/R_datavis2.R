library(ggplot2)
library(forcats)

census = read.csv('docs/acs2017_county_data.csv') #check your PATH to this file
head(census)

# plotting one categorical variable and one numeric variable

ggplot(census[1:100,]) + 
  geom_boxplot(aes(x= State, y=TotalPop))


ggplot(census[1:100,]) + 
  geom_violin(aes(x= State, y=TotalPop))

# plot two numeric variables: scatterplots
ggplot(census) +
  geom_point(aes(x=IncomePerCap, y=Poverty))

ggplot(census) +
  geom_point(aes(x=IncomePerCap, y=Poverty), alpha=0.1) # alpha defines transparency of the points


ggplot(census, aes(x=IncomePerCap, y=Poverty)) +
  geom_point(alpha=0.1) +
  geom_smooth(method = 'gam')

ggplot(census) +
  geom_hex(aes(x=IncomePerCap, y=Poverty))

ggplot(census) +
  geom_density2d(aes(x=IncomePerCap, y=Poverty))


#multpanel plots

# facet functions
ggplot(data=census[census$State %in% c("Alabama", "Oregon", "New York"),]) +
  geom_point(aes(x=IncomePerCap, y = Poverty, color=State)) +
  facet_grid(~State) # facet plots by grouping variable

# try also facet_wrap()
ggplot(data=census[census$State %in% c("Alabama", "Oregon", "New York"),]) +
  geom_point(aes(x=IncomePerCap, y = Poverty, color=State)) +
  facet_wrap(~State)


# patchwork
# install.packages('devtools')
# devtools::install_github("thomasp85/patchwork")
library(patchwork)

scplot = ggplot(data=census) + 
  geom_point(aes(x=IncomePerCap, y=Poverty), alpha=0.1) +
  geom_smooth(aes(x=IncomePerCap, y=Poverty)) 

histplot = ggplot(data = census) +
  geom_histogram(aes(x=IncomePerCap))

histplot2 = ggplot(data = census) +
  geom_histogram(aes(x=Poverty))

# put these together with patchwork

histplot + scplot # side by side

histplot / scplot # over under

# ggsave

ggsave(filename = 'testpatch.png') # plot the last plot

ggsave(filename = 'otherplot.png', plot = histplot / scplot)

saveaplot = histplot / scplot
ggsave(filename = 'multiplot.png', plot = saveaplot)

