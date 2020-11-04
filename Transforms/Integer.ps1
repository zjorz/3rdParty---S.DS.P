
[CmdletBinding()]
param (
    [Parameter()]
    [Switch]
    $FullLoad
)

if($FullLoad)
{
# Add any types that are used by transforms
# CSharp types added via Add-Type are supported
}

#add attributes that can be used with this transform
$SupportedAttributes = @('msDS-Approx-Immed-Subordinates','codePage','countryCode','logonCount')

# This is mandatory definition of transform that is expected by transform architecture
$prop=[Ordered]@{
    BinaryInput=$false
    SupportedAttributes=$SupportedAttributes
    OnLoad = $null
    OnSave = $null
}
$codeBlock = new-object PSCustomObject -property $prop
$codeBlock.OnLoad = { 
    param(
    [string[]]$Values
    )
    Process
    {
        foreach($Value in $Values)
        {
            [int]$Value
        }
    }
}
$codeBlock.OnSave = { 
    param(
    [int[]]$Values
    )
    
    Process
    {
        foreach($Value in $Values)
        {
            "$Value"
        }
    }
}
$codeBlock

