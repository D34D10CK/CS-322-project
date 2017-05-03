import os
import re

#re1 = re.compile(r"(?!(?<=\\,)(?=,))(?<=,)(?=,)|(?<=,)$", re.IGNORECASE)
re1 = re.compile(r"(?=,)(?<=,)(?=,)|(?<=,)$", re.IGNORECASE)
re2 = re.compile(r"(?<=,)NULL(?=,)", re.IGNORECASE)

for filename in os.listdir(os.getcwd()):
    if (filename.endswith('.csv')):
        with open(filename, encoding='utf8') as fin, open('./processed/' + filename, 'a', encoding='utf8') as fout:
            for line in fin.readlines():
                l1 = re.sub(re1, "\\N", line)
                l2 = re.sub(re2, "\\N", l1)
                l3 = l2.replace('\\,', ',')
                fout.write(l3)
