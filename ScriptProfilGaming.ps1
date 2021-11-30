$Desktop    = $env:USERPROFILE + "\Desktop\"
$site = ('https://www.twitch.tv', 'https://discord.com/', 'https://store.steampowered.com/')


ForEach($s in $site)
{
    Start-Process $s
}

Start-Sleep -Seconds 2
$shell = New-Object -ComObject "Shell.Application"
$shell.minimizeall()