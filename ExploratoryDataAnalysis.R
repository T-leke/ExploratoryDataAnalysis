install.packages("tidyverse")
library(tidyverse)

##Exploring the data set
head(starwars)
glimpse(starwars)


##information about Luke sky walker
Luke <- starwars[1,]      #keeps row 1

#using logical indexing
Luke <- filter(starwars, starwars$name == "Luke Skywalker")

#Another way of using logical indexing
Luke <- starwars[starwars$name == "Luke Skywalker",]

starwars %>% filter(name == "Luke Skywalker") -> Luke

print(Luke)
Luke["mass"]
Luke["height"]


#printing the last column
lastcol <- starwars[ , ncol(starwars)]
lastcol

#returning the maximum value for mass
maxMass <- max(starwars$mass, na.rm = TRUE)
maxMass

filter(starwars, starwars$mass == maxMass)
filter(starwars, starwars$mass == max(starwars$mass, na.rm = TRUE))

#plotting 
starplot <-  ggplot(data = starwars, mapping = aes(x = height, y = mass, color = gender, size= birth_year)) + geom_point() + labs(x = "height", y = "mass")+ggtitle("Plot of mass against height") + geom_point(size = 3)  
print(starplot)

#sub grouping the plot
starplot <-  ggplot(data = starwars, mapping = aes(x = height, y = mass, color = gender, size= birth_year)) + geom_point() + labs(x = "height", y = "mass")+ggtitle("Plot of mass against height") + geom_point(size = 3) + facet_grid(. ~ gender, subtitle = "subtitle")
print(starplot)

starplot <-  ggplot(data = starwars, mapping = aes(x = height, y = mass, color = gender, size= birth_year)) + geom_point() + labs(x = "height", y = "mass", title = "plot of mass against height", subtitle = "plot by gender") + geom_point(size = 3) + facet_grid(. ~ gender)
print(starplot)



