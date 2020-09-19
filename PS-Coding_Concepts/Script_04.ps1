<#
    .DESCRIPTION
        An example runbook to read a text file line by line

    .NOTES
        AUTHOR: Anupam.
        LASTEDIT: Sept 19, 2020
#>

$FileName = "Test.txt"
$FilePath = $PSScriptRoot + "\" + $FileName

$Result = Test-Path $filePath

if($Result -eq $true) {
    Write-Output "File exists."

    # Reading content of text file.
    $FileData = Get-Content $FilePath
    foreach ($Line in $FileData){
        Write-Output $Line.Trim()
    }
}
else {
    Write-Output "File doesn't exists."
}
