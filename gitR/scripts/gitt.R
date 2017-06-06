#loading tidyverse package#
library(tidyverse)
gapminder<- read_csv (file = "Data/gapminder-FiveYearData.csv")
#to repeat a txt string multiple times#
rep("This is an example", times=3)
#simplify the script above, shift cmd M to get %>% #
"This is an example" %>% rep(times=3)

year_country_gdp <- select(gapminder,year, country, gdpPercap)
head(year_country_gdp)
year_country_gdp <- gapminder %>% select(year,country,gdpPercap) 
head(year_country_gdp)

gapminder %>% 
  filter(year==2002) %>% 
  ggplot(mapping = aes(x=continent,y=pop))+
  geom_boxplot()

year_country_gdp_euro <- gapminder %>% 
  filter(continent=="Europe") %>% 
  select(year,country,gdpPercap)
  
year_country_gdp_euro   
#write a command that will produce a data frame that has Norwegian values for gdpPercap, lifeExp and year#
country_lifeExp_Norway <- gapminder %>% 
  filter (country=="Norway") %>% 
  select(year,lifeExp,gdpPercap)
country_lifeExp_Norway 

#how to use groupby function#
gapminder %>% 
  group_by(continent)
##summarize function for the groups#
gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap))
  
gapminder %>% 
  summarize(mean_gdpPercap=mean(gdpPercap))









  
  