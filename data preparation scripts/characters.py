import pandas
import re

colnames = ['characters']
data = pandas.read_csv('story.csv', delimiter=',', encoding='utf8', usecols=colnames, dtype='str', quoting=3, header=0, low_memory=False, error_bad_lines=True, warn_bad_lines=True)

re1 = re.compile(r"\(.*\)", re.IGNORECASE)
re2 = re.compile(r"[A-Z]+:", re.IGNORECASE)

with open('characters.txt', 'a', encoding='utf8') as fout:
    for line in data:
        if (line != '\\N'):
            l = re.sub(re1, '', line)
            l = l.replace('[', ';')
            l = l.replace(']', '')
            l = l.replace('(', '')
            l = l.replace(')', '')
            l = re.sub(re2, '', l)
            l = l.replace(':', '')

            for c in line.split(';'):
                fout.write(c.strip())
