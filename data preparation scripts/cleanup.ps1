Get-ChildItem *csv | foreach {(cat $_ -Encoding utf8) -replace '(?!(?<=\\,)(?=,))(?<=,)(?=,)|(?<=,)$|NULL', "\N" | Out-File (join-path -path .\processed\ -ChildPath $_.Name) -Encoding utf8}

Get-ChildItem *csv | foreach {(cat $_ -Encoding utf8) -replace '(?!(?<=\\,)(?=,))(?<=,)(?=,)|(?<=,)$|NULL|\\(,)', '$1\N' | Out-File (join-path -path .\processed\ -ChildPath $_.Name) -Encoding utf8}
