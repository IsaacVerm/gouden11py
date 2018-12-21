library(ggplot2)
library(dplyr)
library(ggpubr)

# load csv
players <- read.csv(file = "players.csv", as.is = (c("name")))

# wrangle
players <- players %>% 
  mutate(roi = points/value) %>% # calculate roi
  group_by(position_id) %>% 
  top_n(20, roi) %>% # only interested in the best picks by position
  arrange(desc(roi)) %>% 
  mutate(group_id = 1:n()) # add unique id within each group of positions
  
# graph roi
ggplot(data = players,
       aes(x = group_id,
           y = roi,
           fill = club_name)) +
  geom_col() +
  ggpubr::rremove("x.text") +
  ggpubr::rremove("x.title") +
  facet_grid(. ~ position_id)
  