import json

from bs4 import BeautifulSoup

with open('raw_data.txt', encoding='utf-8') as r:
    lines = r.read()

color_map = {'red': 'M1', 'blue': 'M2', 'green': 'M3', 'yellow': 'M4'}

metro_lines = {}

soup = BeautifulSoup(lines, 'html.parser')

for html_stop in soup.find_all('li'):
    stop_name = html_stop.text.replace('&nbsp;', '').strip()
    while html_stop.i is not None:
        line_tag = html_stop.i.extract()
        if 'class' in line_tag.attrs:
            for line in line_tag.attrs['class']:
                if str(line).find('-link') > -1:
                    line = str(line).replace('-link', '')
                    line = color_map[line]
                    if line not in metro_lines:
                        metro_lines[line] = []
                    metro_lines[line].append(stop_name)

for line, stops in metro_lines.items():
    print("\nЛиния: " + line)
    for stop in stops:
        print("  " + stop)


with open("metro_lines.json", "w", encoding='utf-8') as outfile:
    json.dump(metro_lines, outfile, ensure_ascii=False)