$Desktop    = $env:USERPROFILE + "\Desktop\"
$site = ('https://cegepba.omnivox.ca/Login/Account/Login', 'https://medium.com/tag/programming', 'https://github.com/login')
$notesFile = $Desktop + "NOTES_$((Get-Date).ToString('yyyy-MM-dd')).txt"

ForEach($s in $site)
{
    Start-Process $s
}

# open visual studio code
Start-Process -WindowStyle Hidden code .
# open notepad++ with textfile named by date of the day and save on the desktop
start notepad++ $notesFile

Start-Sleep -Seconds 2
$shell = New-Object -ComObject "Shell.Application"
$shell.minimizeall()