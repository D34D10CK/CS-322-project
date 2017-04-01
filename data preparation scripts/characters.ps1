#read the characters column
$characters = (Import-Csv .\story.csv -Encoding utf8 | select 'characters').characters
#remove the comments
$characters = $characters -replace '\(.*\)', ''
#remove nulls
$characters = $characters | Select-String -Pattern '\\N' -NotMatch
#remove [] for easier parsing later
$characters = $characters -replace '\[', ';' -replace '\]', ''
#removing the remaining [] and ()
$characters = $characters -replace '\[', '' -replace '\]', '' -replace '\(', '' -replace '\)', ''
#replace other comments
$characters = $characters -replace '[A-Z]+:', ''
#replacing remaining :
$characters = $characters -replace ':', ''
#one character/group per line
$characters = $characters.split(';')
#remove doubles (ultra long)
$characters | foreach{$_.Trim()} | sort -unique | Out-File characters.txt -Encoding utf8
