##############################################################################
# DARKMODE POWERSHELL SCRIPT
# The easiest way to set dark/light theme or switch between of those
# Prerequisites: PowerShell 5.0 or later
# Version: 1.0
# Author: Iminetsoft
# GitHub: https://github.com/iminet/DarkMode
# License: CreativeCommons (CC BY 4.0)
# Usage: DarkMode.ps1 [status|dark|light|toggle] 
#        (without the optional switches, the toggle command will be performed)
##############################################################################

$regkey = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$property = "AppsUseLightTheme"
$darkvalue = 0
$lightvalue = 1
function  SetDark 
{
    Set-ItemProperty -Path $regkey -Name $property -Value $darkvalue
}

function  SetLight 
{
    Set-ItemProperty -Path $regkey -Name $property -Value $lightvalue
}

function IsDark
{
    if ($(Get-ItemPropertyValue -Path $regkey -Name $property) -eq $darkvalue)
    {
        return $true
    }
    else
    {
        return $false    
    }
}

function Toggle
{
    if (IsDark -eq $true) { SetLight }
    else { SetDark }
}

if ($args.Count -ge 1 -and $args[0] -eq "dark") { SetDark }
elseif ($args.Count -ge 1 -and $args[0] -eq "light") { SetLight }
elseif ($args.Count -ge 1 -and $args[0] -eq "status") { Write-Host $(if (IsDark -eq $true) { "Dark theme" } else { "Light theme" } ) }
else { Toggle }