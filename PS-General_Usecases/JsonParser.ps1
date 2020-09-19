<#
    .DESCRIPTION
        An example runbook to parse a Json file

    .NOTES
        AUTHOR: Anupam.
        LASTEDIT: Sept 19, 2020
#>

# Function Definition
Function JsonParser {

    $FileName = "Test.json"
    $FilePath = $PSScriptRoot + "\" + $FileName

    $Result = Test-Path $filePath

    if($Result -eq $true) {
        Write-Output "File exists."

        $FileData = Get-Content -Path $FilePath | ConvertFrom-Json

        for($i=0; $i -lt $FileData.WorkLoads.Count; $i++)
        {
            Write-Output "Subscription: $($FileData.WorkLoads[$i].subscription)"
            Write-Output "Resource Group: $($FileData.WorkLoads[$i].resourceGroup)"
        }
    }
    else {
        Write-Output "File doesn't exists."
    }
}

# Function Calling
JsonParser
