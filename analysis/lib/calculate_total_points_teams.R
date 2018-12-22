calculate_total_points_teams <- function(teams) {
  teams %>%
  map_int(~ sum(.[['points']])) %>%
  as.data.frame(.) %>% 
  setNames(c("points"))
}