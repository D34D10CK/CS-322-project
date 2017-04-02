#read the characters and id columns
$characters = Import-Csv .\story.csv -Encoding utf8 | where {$_.characters -ne '\N'} | select 'characters', 'id'

$csv = New-Object System.Collections.Generic.List[System.Object]
$characters | foreach {
    $chars = $_.characters;
    $chars = $chars -replace '\(.*\)', '';
    $chars = $chars -replace '\[', ';' -replace '\]', '';
    $chars = $chars -replace '\[', '' -replace '\]', '' -replace '\(', '' -replace '\)', '';
    $chars = $chars -replace '[A-Z]+:', '';
    $chars = $chars -replace ':', '';

    $id = $_.id;
    $chars.split(';') | foreach {
        $line = New-Object PSObject -Property @{id=$id; character=$_.Trim()};
        $csv.Add($line);
    }
}

$csv | Export-Csv -Path story-characters.txt -Encoding utf8 -NoTypeInformation
