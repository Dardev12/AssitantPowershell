$Desktop    = $env:USERPROFILE + "\Desktop\"
$site = ('https://www.twitch.tv', 'https://discord.com/', 'https://store.steampowered.com/')


ForEach($s in $site)
{
    Start-Process $s
}

Start-Sleep -Seconds 2
$shell = New-Object -ComObject "Shell.Application"
$shell.minimizeall()

Start-Sleep -Seconds 2
.\SetWallPaper.ps1 "C:\Users\533\Documents\GitHub\AssitantPowershell\gaming.jpg" "Stretch"