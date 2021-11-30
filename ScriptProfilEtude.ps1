$Desktop    = $env:USERPROFILE + "\Desktop\"
$site = ('https://cegepba.omnivox.ca/Login/Account/Login', 'https://medium.com/tag/programming', 'https://github.com/login')
$notesFile = $Desktop + "NOTES_$((Get-Date).ToString('yyyy-MM-dd')).txt"
Set-Location ($env:USERPROFILE + "\Documents\GitHub\AssitantPowershell\")


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


try
{
    # open visual studio code
    Start-Process -WindowStyle Hidden code .
    # open notepad++ with textfile named by date of the day and save on the desktop
    Start-Sleep -Seconds 2
    start notepad++ $notesFile
}
catch
{
    $wshell = New-Object -ComObject Wscript.Shell
    $Output = $wshell.Popup("An error occur while oppening VScode and notepad++")
}


Start-Sleep -Seconds 2
$shell = New-Object -ComObject "Shell.Application"
$shell.minimizeall()
Start-Sleep -Seconds 2


try
{
    .\SetWallPaper.ps1 "C:\Users\533\Documents\GitHub\AssitantPowershell\img.jpg" "Stretch"
}
catch
{
    $wshell = New-Object -ComObject Wscript.Shell
    $Output = $wshell.Popup("An error occur while setting wallpaper")
}
