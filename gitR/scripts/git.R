#to load the tidyverse package

library("tidyverse")

gapminder <- read.csv(file = "Data/gapminder-FiveYearData.csv")

gapminder
##ggplot fuction to link to graph and to data, different functions for visuals, geom (geometrical representation of data), mapping linking something together, maps visual properties of the data to map##
#aes dataset that is source of visual properties of the graph,two dimention plotting (x and y), other dimentions, size and color#
#
ggplot(data = gapminder) +
  geom_point(mapping = aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder) +
  geom_jitter(mapping = aes(x = gdpPercap, y = lifeExp, color= continent))

#scale transformation : points according to size of population, logfuction in x#
ggplot(data = gapminder) +
  geom_point(mapping = aes(x = log(gdpPercap), y = lifeExp, color= continent, size =pop))

#alpha=transparency of the points
ggplot(data = gapminder) +
  geom_point(mapping = aes(x = log(gdpPercap), y = lifeExp), alpha=0.1, size=2, color="blue")

ggplot(data = gapminder) +
  geom_line(mapping = aes(x = log(gdpPercap), y = lifeExp, group=country, color= continent))

ggplot(data = gapminder) +
  geom_line(mapping = aes(x = year, y = lifeExp, group=country, color= continent))

ggplot(data = gapminder) +
  geom_boxplot(mapping = aes (x = continent, y = lifeExp))

ggplot(data = gapminder) +
  geom_jitter(mapping = aes(x= continent, y = lifeExp, color= continent))+
  geom_boxplot(mapping = aes (x = continent, y = lifeExp, color= continent))
#to lift arguments into the same main function, same command as above, but simple for repeating functions#
ggplot(data = gapminder, mapping = aes(x= continent, y = lifeExp, color= continent)) +
  geom_jitter()+
  geom_boxplot()

#change the axis(log transform, jitter spreading the points, for the points the transparancy is 0.5, lm= linear model, geom smooth specific to the layer of the model, geom jitter specific to the points#
ggplot(data = gapminder, mapping = aes(x= log(gdpPercap), y = lifeExp, color= continent)) +
  geom_jitter(alpha=0.5)+
  geom_smooth(method = "lm")
             
ggplot(data = gapminder, mapping = aes(x= log(gdpPercap), y = lifeExp, color= continent)) +
  geom_jitter(alpha=0.1)+
  geom_smooth(method = "lm")

#to hide the color from the linear model (bottom layer) from script above, color to be visible only to points (geom_jitter)#
ggplot(data = gapminder, mapping = aes(x= log(gdpPercap), y = lifeExp)) +
  geom_jitter(mapping = aes(color=continent), alpha=0.1)+
  geom_smooth(method = "lm")

#make a boxplot life expectancy per year#
ggplot(data = gapminder) +
  geom_boxplot (mapping = aes (x= as.factor (year), y=lifeExp))

ggplot(data = gapminder) +
  geom_boxplot (mapping = aes (x= as.factor (year), y=log(gdpPercap)))

ggplot(data = gapminder) +
  geom_density2d (mapping = aes (x= lifeExp, y=log(gdpPercap)))

#facet function: splits graph by graphical representations#
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp))+
  geom_point()+
  geom_smooth() +
  scale_x_log10()+
  facet_wrap(~ continent)

#Try faceting by year, keeping the linear smoother. Is there any change in slope of the linear trend over the years? What if you look at linear models per continent?#

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp))+
  geom_point()+
  geom_smooth(method = "lm") +
  scale_x_log10()+
  facet_wrap(~ year)

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp))+
  geom_point()+
  geom_smooth(method = "lm") +
  scale_x_log10()+
  facet_wrap(~ continent)

#filter function # shrink the dataset to one year#
ggplot(data=filter(gapminder, year==2007)+
         geom_bar(mapping = aes(x=continent))
       
#wrap it to ggplot function#
ggplot(data=filter(gapminder, year==2007))+
       geom_bar(mapping = aes(x=continent), stat = "count")

ggplot(data=filter(gapminder, year==2007, continent=="Oceania"))+
  geom_bar(mapping = aes(x=country, y=pop), stat = "identity")
#script where identity predifined #
ggplot(data=filter(gapminder, year==2007, continent=="Oceania"))+
  geom_col(mapping = aes(x=country, y=pop))
#refiltered data to Asian countries#
ggplot(data=filter(gapminder, year==2007, continent=="Asia"))+
  geom_col(mapping = aes(x=country, y=pop))
#add a layer, flip coordinates (rearrange the coordinates)#
ggplot(data=filter(gapminder, year==2007, continent=="Asia"))+
  geom_col(mapping = aes(x=country, y=pop))+
  coord_flip()

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp, color=continent))+
  geom_point()+
  geom_smooth(method = "lm") +
  scale_x_log10()+
  facet_wrap(~ year)

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp, color=continent, size=pop/10*6))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~ year)

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp, color=continent, size=pop/10*6))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~ year)+
  labs(title="Life expectancy vs GDP per capita over time", subtitle="In the last 50 years, life expectancy has improved in most countries", 
       caption="Source: Gapminder foundation, gapminder.com",
       x="GDP per capita, in 000 USD", y="life expectancy in years", color="continet", size= "population, in millions")

ggsave("my_fancy_plot.png")











