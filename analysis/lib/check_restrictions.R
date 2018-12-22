assert_value_team_ok <- function(team) {
  sum(team$value) <= 250
}

assert_max_players_by_club_ok <- function(team) {
  all(table(team$club_id) <= 2)
}

filter_out_violating_team <- function(team) {
  if (assert_value_team_ok(team) & assert_max_players_by_club_ok(team)) {
    return(team)
  }
}