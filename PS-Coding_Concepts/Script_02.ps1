<#
    .DESCRIPTION
        An example runbook to create a custom object

    .NOTES
        AUTHOR: Anupam.
        LASTEDIT: Sept 19, 2020
#>

# Function Definition
Function CreateCustomObject {
	$ResultsArray = @()
	$ItemDetails = [PSCustomObject] @{    
		FullName = "Anupam"
		UserName = "AnupamY"
	}

	# Add data to array
	$ResultsArray += $ItemDetails
	
	$ItemDetails = [PSCustomObject] @{    
		FullName = "Anurag"
		UserName = "AnuragY"
	}

	# Add data to array
	$ResultsArray += $ItemDetails

    return $ResultsArray
}

# Function Definition
Function ReadCustomObject {
	Param (
	    [parameter(Mandatory=$True)] [PSObject] $MyCustomObj
	)

	foreach ($Result in $MyCustomObj) {
		Write-Output "FullName: $($Result.FullName)"
		Write-Output "UserName: $($Result.UserName)"
	}
}

# Function Calling
$Output = CreateCustomObject
ReadCustomObject -MyCustomObj $Output