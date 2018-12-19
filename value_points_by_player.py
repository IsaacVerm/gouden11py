import requests
import csv

# get the players
players = requests.get(
    'https://goudenspelen.nanoapp.io/players.json?competition_feed=G11&season_id=2019&week_id=all').json()['Players']

# open csv to output to
players_output_file = open('players.csv', 'w')
players_output_writer = csv.writer(players_output_file)

# write header to csv
players_output_writer.writerow(
    ['player_id', 'name', 'position_id', 'points', 'value', 'club_id', 'club_name'])

# parse the relevant variables and write to csv player by player
for player in players:
    relevant_player = {'player_id': player['Player']['id'],
                       'name': player['Player']['name'],
                       'position_id': player['Player']['position_id'],
                       'points': player['Player']['points'],
                       'value': player['Player']['value'],
                       'club_id': player['Club']['id'],
                       'club_name': player['Club']['name']}
    players_output_writer.writerow(relevant_player.values())

# close the csv
players_output_file.close()
