import requests
import json
from bs4 import BeautifulSoup

# gets this week's current NFL odds from Bovada's API

url = 'https://www.bovada.lv/services/sports/event/v2/events/A/description/football/nfl'

r = requests.get(url)

j = r.json()

events = j[0]["events"]

matches = []

for e in events:
    description = e['description']
    outcomes = e['displayGroups'][0]['markets'][0]['outcomes']

    team1name = outcomes[0]['description']
    team1odds = outcomes[0]['price']['decimal']

    team2name = outcomes[1]['description']
    team2odds = outcomes[1]['price']['decimal']

    match = {
        "team1" : team1name,
        "team2" : team2name,
        "odds1" : float(team1odds),
        "odds2" : float(team2odds)
    }

    matches.append(match)


with open('./tools/matches.json', 'w') as outfile:
    json.dump(matches, outfile)
