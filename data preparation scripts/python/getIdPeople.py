#!/usr/bin/python
import sys
import pandas as pd

def setcsv(attribute):
    #extract the story and people csv file as a pandas dataframe
    story = pd.read_csv('story.csv', error_bad_lines=False)
    #Create pandas DataFrame, with the columns id and attribute of the story dataframe
    newCSV = story[['id', attribute]]
    #Delete null, duplicate, and ? of the attribute column
    newCSV = newCSV.dropna().drop_duplicates().drop(newCSV[(newCSV[attribute]=='?')].index).reset_index(level=0, drop=True)

    #split attribute separate by ; and create new row for each new people
    newCSVSep = pd.DataFrame(newCSV[attribute].str.split(';').tolist()).stack()
    newCSVSep.index = newCSVSep.index.droplevel(-1)
    newCSVSep.name = attribute
    del newCSV[attribute]
    newCSV = newCSV.join(newCSVSep)

    #delete space char add during split
    newCSV[attribute] = newCSV[attribute].map(lambda x: x.lstrip(' ').rstrip(' '))

    #save as a new csv file
    nameFile = attribute + '.csv'
    newCSV.to_csv(nameFile, index=False)


def main():
    attribute = sys.argv[1]
    #attribute must be script, colors, inks, pencils
    setcsv(attribute)

if __name__ == '__main__':
    main()
