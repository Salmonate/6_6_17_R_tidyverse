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

gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap)) %>% 
  ggplot(mapping = aes(x=continent,y=mean_gdpPercap))+
  geom_point()

#calculate the average life expectancy per country in Asia. which country has the longest and 
gapminder %>% 
  filter(continent=="Asia") %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
  filter(mean_lifeExp==min(mean_lifeExp)|mean_lifeExp==max(mean_lifeExp))

gapminder %>% 
  filter(continent=="Asia") %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
  ##not inlude
  #filter(mean_lifeExp==min(mean_lifeExp)|mean_lifeExp==max(mean_lifeExp))#
  ggplot(mapping = aes(x=country,y=mean_lifeExp))+
  geom_point()+
  order()
  coord_flip()
  
  gapminder %>% 
    filter(continent=="Asia") %>% 
    group_by(country) %>% 
    summarize(mean_lifeExp=mean(lifeExp)) %>%
    ggplot(mapping = aes(x=country,y=mean_lifeExp))+
    geom_point()+
    order()+
  coord_flip()
  
 gapminder %>% 
   mutate(gdp_billion=gdpPercap*pop/10*9) %>% 
   head()
 
 gapminder %>% 
   mutate(gdp_billion=gdpPercap*pop/10*9) %>% 
   group_by(continent,year) %>% 
   summarize(mean_gdp_billion=mean(gdp_billion))
 
#visualise global life expectancy on map of the world# 
 
#first load maps library#
 library(maps)

 map_data("world") %>% 
   head()
#rename region variable to country#
 map_data("world") %>% 
   rename(country=region) %>% 
#cread an object#
gapminder_country_summary <- gapminder %>% 
   group_by(country) %>% 
   summarize(mean_lifeExp = mean(lifeExp))
 #merge the above dataframe with gapminder dataframe, specify how we want to join these two, group variabe wo show which group belongs to which country# 
 #scale fill gradient:colours for gradient, color gradient for life expectancy # 
 library(maps)
   map_data("world") %>% 
   rename(country=region) %>% 
   left_join(gapminder_country_summary,by="country" ) %>% 
   ggplot()+
   geom_polygon(aes(x=long, y=lat, group=group, fill= mean_lifeExp))+
   scale_fill_gradient(low = "blue",high = "red")+
   coord_equal()
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 













  
  