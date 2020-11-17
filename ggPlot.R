# ctrl- L to Clear screen
# ctrl + enter to Run selection
devtools::install_github("kjhealy/socviz")
library(tidyverse)
library(socviz)
library(here)

library(gapminder)

gapminder

# Examples https://www.oreilly.com/library/view/r-for-data/9781491910382/ch01.html

#################################################
p <- ggplot(data = gapminder)

p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))

p # Why does nothing show?

p + geom_point()

##############################################
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y=lifeExp))
p + geom_smooth()

#############################################
# generalized  Additive Model
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y=lifeExp))
p + geom_point() + geom_smooth() 
## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

#############################################
# Linear Model
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y=lifeExp))
p + geom_point() + geom_smooth(method = "lm") 
################################################
# GAM + Log10 Transform (x-axis)
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y=lifeExp))
p + geom_point() +
  geom_smooth(method = "gam") +
  scale_x_log10()


#  Log10 Transform (y-axis)
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y=lifeExp))
p + geom_point() +
  geom_smooth(method = "gam") +
 scale_y_log10()

###############################################
# scales::dollar using scales
# library(scales)
# Try scales::comma
p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y=lifeExp))
p + geom_point() +
  geom_smooth(method = "gam") +
  scale_x_log10(labels = scales::dollar)
###############################################
#aesthetic mapping 
###############################################
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = "purple"))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()
###############################################
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") +
  scale_x_log10()
###############################################

# se option = standard error = false
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(alpha = 0.3) +
  geom_smooth(color = "orange", se = FALSE, size = 8, method = "lm") +
  scale_x_log10()
###############################################

#Labels
p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y=lifeExp))
p + geom_point(alpha = 0.3) +
  geom_smooth(method = "gam") +
  scale_x_log10(labels = scales::dollar) +
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")
###############################################
# 

gapminder

p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()
###############################################
# legend color and fill
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent,
                          fill = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()
###############################################
#Aesthetics can be mapped per geom

p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
p + geom_point(mapping = aes(color = continent)) +
  geom_smooth(method = "loess") +
  scale_x_log10()
###############################################
# map continuous variables to the color aesthetic
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(mapping = aes(color = log(pop))) +
  scale_x_log10() 

###############################################
# ggsave(filename = "my_figure.png")
# ggsave(filename = "my_figure.pdf")


p_out <- p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()

ggsave("images/my_figure.pdf", plot = p_out,  height = 8, width = 10, units = "in")
ggsave(here("images", "lifexp_vs_gdp_gradient.pdf"), plot = p_out)

