import requests
import csv

# open csv to output to
formations_used_output_file = open('formations_used_top_100_users.csv', 'w')
formations_used_output_writer = csv.writer(formations_used_output_file)

# get teams
teams = requests.get(
    'https://goudenspelen.nanoapp.io/rankings.json?competition_feed=G11&limit=100&page=1&search_query=&season_id=2019&type=general').json()['Teams']

# extract team ids
team_ids = []
for team in teams:
    team_ids.append(team['Team']['id'])

# get the teams selected and calculate formation by team
formation_formulas = []
for id in team_ids:
    # get formation
    formation = requests.get(
        f'https://goudenspelen.nanoapp.io/teams/get.json?id={id}&week=19').json()['starting']

    # calculate formation
    formation_formula = []
    for position in ["2", "3", "4"]:  # keeper is always position 1
        formation_formula.append(str(len(formation[position])))
    formation_formula = '-'.join(formation_formula)

    formations_used_output_writer.writerow([formation_formula])

# close the csv
formations_used_output_file.close()
