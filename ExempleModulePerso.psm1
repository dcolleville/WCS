<#
    .Synopsis
    Indique le taux d'espace libre

    .Description
    Indique le taux d'espace libre

    .Parameter Letter
    Entrer la lettre de lecteur telle que c:

    .Example
    Get-DriverFreeSpace-Dominique -Letter 'c:'

    .Link
    Get-DriverFreespace-Dominique
#>

Function Set-Popup-Perso
{
    param([string]$Title,[string]$Message)
    $owsh=New-Object -ComObject wscript.shell
    $owsh.popup($Message,0,$Title)
    $owsh=$null
}


<#
    .Synopsis
    Indique le taux d'espace libre

    .Description
    Indique le taux d'espace libre

    .Parameter Letter
    Entrer la lettre de lecteur telle que c:

    .Example
    Get-DriverFreeSpace-Dominique -Letter 'c:'

    .Link
    Get-DriverFreespace-Dominique
#>

Function Get-DriveFreeSpace-Dominique
{
    Param([String]$Letter)
    $Drives=Get-WmiObject Win32_LogicalDisk | Where Size -NE $null
    Foreach($Drive in $Drives)
    {
        If($Drive.DeviceID -eq $Letter)
        {
            $res=[Math]::round($Drive.FreeSpace/$Drive.Size*100,2)
            write-host "le % libre est: "$res
        }
    }
}