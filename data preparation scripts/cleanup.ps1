Get-ChildItem *csv | foreach {
    $csv = (cat $_ -Encoding utf8) -replace '(?!(?<=\\,)(?=,))(?<=,)(?=,)|(?<=,)$', "\N" -replace ',NULL,', ",\N,";
    # | Out-File (join-path -path .\processed\ -ChildPath $_.Name) -Encoding utf8
    $path = join-path -path .\processed\ -ChildPath $_.Name | resolve-path;
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
    [IO.File]::WriteAllLines($path, $csv, $Utf8NoBomEncoding)
}
