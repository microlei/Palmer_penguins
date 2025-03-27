# Load libraries
library(tidyverse)
library(here)

# load data, using here to automatically fetch project directory
penguins <- read_csv(here("data_processed/penguins.csv"))

# plot flipper vs bill length
flipper_bill <- ggplot(data = penguins,
                       aes(x = flipper_length_mm,
                           y = bill_length_mm)) +
  # plot scatter plot, changed size to 3 for readability, changed alpha for overlapping points
  geom_point(aes(color = species, 
                 shape = species),
             size = 3,
             alpha = 0.8) +
  # changed the colors for color-blindness
  scale_color_manual(values = c("darkorange","purple","cyan4")) +
  # add labels
  labs(title = "Flipper and bill length",
       subtitle = "Dimensions for Adelie, Chinstrap and Gentoo Penguins at Palmer Station LTER",
       x = "Flipper length (mm)",
       y = "Bill length (mm)",
       color = "Penguin species",
       shape = "Penguin species") +
  # change legend position to lower right
  # change the plot title and caption positions to not be centered
  # change caption to be italic (doesn't seem to have worked?)
  theme(legend.position = c(0.85, 0.15),
        plot.title.position = "plot",
        plot.caption = element_text(hjust = 0, face= "italic"),
        plot.caption.position = "plot")

# save in figures directory with same name as script to generate 
ggsave(flipper_bill, filename=here("figures/figure_1_flipper_bill.png"))
