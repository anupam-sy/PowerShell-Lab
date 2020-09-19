<#
    .DESCRIPTION
        An example runbook to write and read a CSV file

    .NOTES
        AUTHOR: Anupam.
        LASTEDIT: Sept 19, 2020
#>

$OutputFile = "Test.csv"
$OutputFilePath = $PSScriptRoot + "\" + $OutputFile

Function WriteToCSV {
	$ResultsArray = @()
	$ItemDetails = [PSCustomObject] @{    
		FullName = "Anupam"
		UserName = "AnupamY"
	}

	# Add data to array
	$ResultsArray += $ItemDetails
	
	$ItemDetails = [PSCustomObject] @{    
		FullName = "Arun"
		UserName = "ArunY"
	}

	# Add data to array
	$ResultsArray += $ItemDetails

	# Export data to CSV
	$ResultsArray | Export-CSV $OutputFilePath -NoTypeInformation
}

Function ReadFromCSV {
	$ResultsArray = Import-Csv -Path $OutputFilePath
	foreach ($Result in $ResultsArray) {
		Write-Host "FullName:" $($Result.FullName)
		Write-Host "UserName:" $($Result.UserName)
	}
}

# Function Calling
WriteToCSV
ReadFromCSV