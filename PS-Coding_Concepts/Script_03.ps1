# Usecase: Pass the parameters from Command Line

<#
    .DESCRIPTION
        An example runbook to execute a PS Script by passing the parameters from Command Line

    .NOTES
        AUTHOR: Anupam.
        LASTEDIT: Sept 19, 2020
#>

Param (
    [parameter(Mandatory=$True)] [int] $FirstNum,
    [parameter(Mandatory=$True)] [int] $SecondNum
)

# Function Definition
Function sumCalculator($Num01, $Num02) {

    $sum = $Num01 + $Num02
    return $sum

}

# Function Calling
$result = sumCalculator $FirstNum $SecondNum
Write-Output "Sum is: $($result)"