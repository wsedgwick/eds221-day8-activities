

library(tidyverse)
library(palmerpenguins)


ggplot(data = na.omit(penguins), aes(x = species, y = body_mass_g, shape = sex)) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.5)) + 
  # means & standard devs
  stat_summary(mapping = aes(color = species),
               fun = "mean", geom = "point", size = 4,
               position = position_dodge(width = 0.4)) +
  stat_summary(mapping = aes(color = species),
               fun = "mean", geom = "errorbar", size = 1, width = 0.2,
               position = position_dodge(width = 0.4),
               fun.max = function(x) mean(x) + sd(x),
               fun.min = function(x) mean(x) - sd(x)) +
  annotate("text", x = "Adelie", y = 5000, label = "These be Adelies'!", color = "blue") +
  # change colors/shapes
  scale_color_manual(values = c("#FF8C02", "#A93FF1", "#148F90"), name = "Species") + 
  scale_shape_manual(values = c(15, 16), name = "Sex") + 
  # add nicer axis labels + title + caption
  labs(x = "Penguin Species", 
       y = "Body Mass (g)",
       title = "Body mass of female vs. male adelie, chinstrap, and gentoo penguins",
       subtitle = "Colored points represent mean body mass (± SD)",
       caption = "Data Source: Dr. Kristen Gorman, LTER Palmer Station") +
  theme_classic() + 
  theme(
    plot.title = element_text(hjust = 0, size = 14),
    axis.text = element_text(color = "black", size = 10),
    axis.title = element_text(color = "black", size = 14),
    plot.caption = element_text(size = 7, hjust = 1, color = "gray", face = "italic"),
    panel.border = element_rect(color = "black", size = 0.7, fill = NA))






