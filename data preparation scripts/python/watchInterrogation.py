#!/usr/bin/python
import sys
import pandas as pd

def setcsv(csvname):
    csv = pd.read_csv(csvname, error_bad_lines=False).dropna()

    csvbool = csv[csv.columns[1]].str.contains(r'\?')
    csv = csv.loc[csvbool]

    fileName = '2' + csvname
    csv.to_csv(fileName, index=False)


def main():
    csvname = sys.argv[1]
    setcsv(csvname)

if __name__ == '__main__':
    main()
