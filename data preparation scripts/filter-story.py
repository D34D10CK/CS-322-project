import pandas

colnames = ['id', 'title', 'issue_id', 'synopsis', 'reprint_notes', 'notes', 'type_id']
data = pandas.read_csv('story.csv', delimiter=',', encoding='utf8', usecols=colnames, dtype='str', quoting=3, header=0, low_memory=False, error_bad_lines=True, warn_bad_lines=True)
data.to_csv('story.txt', delimiter=',', encoding='utf8', index=False)
