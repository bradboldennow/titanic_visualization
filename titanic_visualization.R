# Get titanic data set
df <- read.csv(file.choose()) 
attach(df)

str(df)
head(df)

install.packages("ggplot2")
library(ggplot2)

# Distribution of sexes within the classes of the ship
ggplot(df, aes(x = factor(pclass), fill = factor(sex))) +
    geom_bar(position = "dodge")

# Adding a facet grid layer to gain insights into survival
ggplot(df, aes(x = factor(pclass), fill = factor(sex))) +
    geom_bar(position = "dodge") +
    facet_grid(. ~ survived)

# Define jitter position
posn.j = position_jitter(.5, 0)

# Add the age variable to the y axis to get more detialed chart
ggplot(df, aes(x = factor(pclass), y = age, col = factor(sex))) +
    geom_jitter(size = 3, alpha = .5, position = posn.j) +
    facet_grid(. ~ survived)
