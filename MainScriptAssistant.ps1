# Auteur Darren Lambert Leo Mercier
# Fichier MainScriptAssistant.ps1
#
# Script pour Executer l'interface de notre BOT

#=========================Assistant Vocal============================================
function MonteBot{
    param(
        $sayTheLine,
        $rate
    )

    try
    {
        Add-Type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        
        $speak.Rate = $rate
        $speak.Speak($sayTheLine)
    }
    catch
    {
        $wshell = New-Object -ComObject Wscript.Shell
        $Output = $wshell.Popup("Erreur: Le Bot n'arrive plus à Communiquer avec nous")
    }

}
#====================================================================================

try
{
    #=====Section Création Forms==================================================
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $Form = New-Object System.Windows.Forms.Form
    $Form.ClientSize = '300,300'
    $Form.Text = "MonteBot Interface"

    #=====Section Education===============================================
    $BoutonEducation = New-Object System.Windows.Forms.Button
    $BoutonEducation.Location = New-Object System.Drawing.Point(100,100)
    $BoutonEducation.Width = 80
    $BoutonEducation.Height = 40
    $BoutonEducation.Text = "Session Etude"

    #=====Section Gaming==================================================
    $BoutonGaming = New-Object System.Windows.Forms.Button
    $BoutonGaming.Location = New-Object System.Drawing.Point(100,150)
    $BoutonGaming.Width = 80
    $BoutonGaming.Height = 40
    $BoutonGaming.Text = "Session Gaming"

    #=====Section Fermer Session==========================================
    $BoutonClose = New-Object System.Windows.Forms.Button
    $BoutonClose.Location = New-Object System.Drawing.Point(100,200)
    $BoutonClose.Width = 80
    $BoutonClose.Height = 40
    $BoutonClose.Text = "Débrancher MonteBot"

    #=====Section Label==========================================
    $Label = New-Object System.Windows.Forms.Label
    $Label.Location = New-Object System.Drawing.Point(100,50)
    $Label.Size = '100,100'
    $Label.Text = "bonjour"

    $Title = New-Object System.Windows.Forms.Label
    $Title.Font = [System.Drawing.Font]::new("Microsoft Sans Serif", 12, [System.Drawing.FontStyle]::Bold)
    $Title.Location = New-Object System.Drawing.Point(100,30)
    $Title.Text = "MonteBot"
}
catch
{
    $wshell = New-Object -ComObject Wscript.Shell
    $Output = $wshell.Popup("Erreur: Un Problème est apparu lors de la création d'un ou plusieurs Composant du Forms")
}


#=====Section Event Click==========================================
$BoutonEducation.Add_Click({
    $Label.Text = "Passons au choses sérieuse !!!"
    try
    {
        MonteBot -sayTheLine "Passons au choses sérieuse !!!" -rate 0

        Set-Location "C:\Users\533\Documents\GitHub\AssitantPowershell\"
        .\ScriptProfilEtude.ps1
    }
    catch
    {
        $wshell = New-Object -ComObject Wscript.Shell
        $Output = $wshell.Popup("Erreur: Initialisation de la session Education impossible")
    }

})


$BoutonGaming.Add_Click({
    $Label.Text = "Gaming Lets go"
    
    try
    {
        MonteBot -sayTheLine "Gaming Lets go" -rate 5
    
        Set-Location "C:\Users\533\Documents\GitHub\AssitantPowershell\"
        .\ScriptProfilGaming.ps1
    }
    catch
    {
        $wshell = New-Object -ComObject Wscript.Shell
        $Output = $wshell.Popup("Erreur: Initialisation de la session Gaming impossible")
    }
})


$BoutonClose.Add_Click({
    $Label.Text = "-_- Goodbye "
    try
    {
        MonteBot -sayTheLine "Good bye " -rate -1
        $Form.Close()
    }
    catch
    {
        $wshell = New-Object -ComObject Wscript.Shell
        $Output = $wshell.Popup("Erreur: Impossible de quitter le programme, Veuillez Faire Alt + F4")
    }
})
#======================================================================================================




MonteBot -sayTheLine "Bonjour maître, Comment allez-vous ? !!!" -rate 0

try
{
    $Form.controls.AddRange(@($BoutonEducation,$Label,$BoutonGaming,$Title,$BoutonClose))
    $Form.ShowDialog()
}
catch
{
    $wshell = New-Object -ComObject Wscript.Shell
    $Output = $wshell.Popup("Erreur: Le Sytème n'arrive pas à afficher l'interface")
}