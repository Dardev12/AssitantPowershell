# Auteur Darren Lambert Leo Mercier
# Fichier ScriptProfilGaming.ps1
#
# Script pour configurer un profil Gaming à notre session


$Desktop    = $env:USERPROFILE + "\Desktop\"
$site = ('https://www.twitch.tv', 'https://discord.com/', 'https://store.steampowered.com/')
Set-Location "C:\Users\533\Documents\GitHub\AssitantPowershell\"

try
{
    ForEach($s in $site)
    {
        Start-Process $s
        Start-Sleep -Seconds 1
    }
}
catch
{
    $wshell = New-Object -ComObject Wscript.Shell
    $Output = $wshell.Popup("An error occur while oppening websites")
}

Start-Sleep -Seconds 2
$shell = New-Object -ComObject "Shell.Application"
$shell.minimizeall()
Start-Sleep -Seconds 2

try
{
    .\SetWallPaper.ps1 "C:\Users\533\Documents\GitHub\AssitantPowershell\gaming.jpg" "Stretch"
}
catch
{
    $wshell = New-Object -ComObject Wscript.Shell
    $Output = $wshell.Popup("An error occur while setting wallpaper")
}
