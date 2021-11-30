$Desktop    = $env:USERPROFILE + "\Desktop\"
$site = ('https://cegepba.omnivox.ca/Login/Account/Login', 'https://medium.com/tag/programming', 'https://github.com/login')
$notesFile = $Desktop + "NOTES_$((Get-Date).ToString('yyyy-MM-dd')).txt"
Set-Location "C:\Users\533\Documents\GitHub\AssitantPowershell\"

ForEach($s in $site)
{
    Start-Process $s
    Start-Sleep -Seconds 1
}

# open visual studio code
Start-Process -WindowStyle Hidden code .
# open notepad++ with textfile named by date of the day and save on the desktop
Start-Sleep -Seconds 2
start notepad++ $notesFile

Start-Sleep -Seconds 2
$shell = New-Object -ComObject "Shell.Application"
$shell.minimizeall()

Start-Sleep -Seconds 2
.\SetWallPaper.ps1 "C:\Users\533\Documents\GitHub\AssitantPowershell\img.jpg" "Stretch"