<#
    .DESCRIPTION
        An example runbook to parse a hashtable / dictionary object

    .NOTES
        AUTHOR: Anupam.
        LASTEDIT: Sept 19, 2020
#>

# Function Definition
Function CreateHashTable {

    $hashTable = @{}
    $KeyArray = @("Name", "Company")
    $ValueArray = @("Anupam", "HCL")

    # Add Key-Value pair in Hash Table
    $ArrayLength = $KeyArray.length
    for ($i=0; $i -lt $ArrayLength; $i++) {
        $hashTable.Add($KeyArray[$i], $ValueArray[$i])
    }

    Write-Output $hashTable

    ReadHashTable -HashTableParam $hashTable

}

# Function Definition
Function ReadHashTable {

    Param (
        [parameter(Mandatory=$True)] [hashtable] $HashTableParam
    )

    # Read Key-Value pair from Hash Table
    foreach ($Key in $HashTableParam.Keys) {
        Write-Output "Key: $($Key) and Value: $($HashTableParam[$key])"
    }

}

# Function Calling
CreateHashTable