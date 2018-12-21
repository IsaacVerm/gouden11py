import requests
import csv

# get the teams of top 100 users
teams = requests.get(
    'https://goudenspelen.nanoapp.io/rankings.json?competition_feed=G11&limit=100&page=1&search_query=&season_id=2019&type=general').json()['Teams']

# open csv to output to
points_by_team_output_file = open(
    './extract/csv/points_teams_top_users.csv', 'w')
points_by_team_output_writer = csv.writer(points_by_team_output_file)

# write header to csv
points_by_team_output_writer.writerow(
    ['team', 'rank', 'points'])

# parse the relevant variables and write to csv player by player
for team in teams:
    team_stats = {'team': team['Team']['name'],
                  'rank': team['Team']['rank'],
                  'total_points': team['Team']['points']}
    points_by_team_output_writer.writerow(team_stats.values())

# close the csv
points_by_team_output_file.close()
