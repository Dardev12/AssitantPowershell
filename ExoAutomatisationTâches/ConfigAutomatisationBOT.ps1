# Auteur Darren Lambert
# Fichier ConfigAutomatisationBOT.ps1
#
# Script pour configurer notre BOT de façon automatisé
# Taches programmes.

Write-Output "Execution de l'automatisation du BOT ...."

#=============Initialisation============================================

$TaskName = "BotAutomatisation"

#=============Fonction==================================================

function WaitForState
{
    param( $State )

    $Info = Get-ScheduledTask -TaskName $TaskName
    while( $State -ne $Info.State)
    {
        Start-Sleep -Seconds 1
        $Info = Get-ScheduledTask -TaskName $TaskName
    }
}

#============Execution====================================================

$Now = Get-Date
$Time = $Now.AddMinutes(1)

$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument ( "C:\Users\533\Documents\GitHub\AssitantPowershell\MainScriptAssistant.ps1" )
$Desc = " Bot Autonome "
#$Trigger = New-ScheduledTaskTrigger -Once -At $Time
$Trigger = New-ScheduledTaskTrigger -AtLogon

$Task = New-ScheduledTask -Action $Action -Description $Desc -Trigger $Trigger

Register-ScheduledTask -InputObject $Task -TaskName $TaskName
if( -Not $? )
{
    Write-Error " La Configuration à échoué"
    exit 10
}

WaitForState -State Running

Write-Output " La tache est en cours d'execution "

WaitForState -State Ready

Write-Output " La tache s'est terminé "

Unregister-ScheduledTask -TaskName $TaskName
if( -Not $? )
{
    Write-Error " La Configuration à échoué"
    exit 10
}

Write-Output OK