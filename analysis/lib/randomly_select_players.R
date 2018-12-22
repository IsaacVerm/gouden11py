randomly_select_players <- function(players_df, nr_defenders, nr_midfielders, nr_attackers) {
  # randomly select players
  keeper <- players_df %>% filter(position_id == 1) %>% sample_n(1) # always select a keeper
  defenders <- players_df %>% filter(position_id == 2) %>% sample_n(nr_defenders)
  midfielders <- players_df %>% filter(position_id == 3) %>% sample_n(nr_midfielders)
  attackers <- players_df %>% filter(position_id == 4) %>% sample_n(nr_attackers)
  
  # bind together
  return(bind_rows(keeper, defenders, midfielders, attackers))
} 