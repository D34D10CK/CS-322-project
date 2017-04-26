#!/usr/bin/python
import sys
import pandas as pd

def setcsv(csvname):
    csv = pd.read_csv(csvname, error_bad_lines=False).dropna()

    csv[csv.columns[1]] = csv[csv.columns[1]].replace({r' ?\?| ?\(.*\)|^[^A-Za-z]+$| ?\.| ?\:': r''}, regex=True)
    csv[csv.columns[1]] = csv[csv.columns[1]].map(lambda x: x.lstrip(' ').rstrip(' '))
    csv = csv.drop(csv[csv[csv.columns[1]]==''].index).drop_duplicates().dropna()
    csvSort = csv.sort_values(csv.columns[1])

    fileName1 = 'cl_' + csvname
    fileName2 = 'st_' + csvname
    csv.to_csv(fileName1, index=False)
    csvSort.to_csv(fileName2, index=False)


def main():
    csvname = sys.argv[1]
    setcsv(csvname)

if __name__ == '__main__':
    main()
