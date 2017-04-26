#!/usr/bin/python
import sys
import pandas as pd

def setpeople():
    script = pd.read_csv('cl_script.csv', error_bad_lines=False).dropna()
    pencils = pd.read_csv('cl_pencils.csv', error_bad_lines=False).dropna()
    inks = pd.read_csv('cl_inks.csv', error_bad_lines=False).dropna()
    colors = pd.read_csv('cl_colors.csv', error_bad_lines=False).dropna()

    script = script[['script']].drop_duplicates().rename(columns = {'script': 'people'})
    pencils = pencils[['pencils']].drop_duplicates().rename(columns = {'pencils': 'people'})
    inks = inks[['inks']].drop_duplicates().rename(columns = {'inks': 'people'})
    colors = colors[['colors']].drop_duplicates().rename(columns = {'colors': 'people'})

    people = pd.concat([script, pencils, inks, colors]).drop_duplicates().reset_index(drop=True).sort_values('people')

    people.to_csv('people.csv', index=False)


def main():
    setpeople()

if __name__ == '__main__':
    main()