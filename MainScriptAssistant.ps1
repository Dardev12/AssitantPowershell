function MonteBot{
    param(
        $sayTheLine,
        $rate
    )

    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    #$speak | Get-Member
    #Foreach ($voice in $speak.GetInstalledVoices()){
    #$Voice.VoiceInfo | Select-Object Gender, Name, Culture, Description
    #}

    $speak.SelectVoice('Microsoft Hortense Desktop')
    $speak.Rate = $rate
    $speak.Speak($sayTheLine)

}

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$Form = New-Object System.Windows.Forms.Form
$Form.ClientSize = '300,300'
$Form.Text = "MonteBot Interface"

$BoutonEducation = New-Object System.Windows.Forms.Button
$BoutonEducation.Location = New-Object System.Drawing.Point(100,100)
$BoutonEducation.Width = 80
$BoutonEducation.Height = 40
$BoutonEducation.Text = "Session Etude"
$BoutonEducation.Add_Click({
    $Label.Text = "Passons au choses sérieuse !!!"
    MonteBot -sayTheLine "Passons au choses sérieuse !!!" -rate 0
    
    Set-Location "C:\Users\533\Documents\GitHub\AssitantPowershell\"
    .\ScriptProfilEtude.ps1

})

$BoutonGaming = New-Object System.Windows.Forms.Button
$BoutonGaming.Location = New-Object System.Drawing.Point(100,150)
$BoutonGaming.Width = 80
$BoutonGaming.Height = 40
$BoutonGaming.Text = "Session Gaming"
$BoutonGaming.Add_Click({
    $Label.Text = "Gaming Lets go"
    MonteBot -sayTheLine "Gaming Lets go" -rate 5
    
    Set-Location "C:\Users\533\Documents\GitHub\AssitantPowershell\"
    .\ScriptProfilGaming.ps1
    
})

$BoutonClose = New-Object System.Windows.Forms.Button
$BoutonClose.Location = New-Object System.Drawing.Point(100,200)
$BoutonClose.Width = 80
$BoutonClose.Height = 40
$BoutonClose.Text = "Débrancher MonteBot"
$BoutonClose.Add_Click({
    $Label.Text = "-_- Goodbye "
    MonteBot -sayTheLine "Good bye " -rate -1
    $Form.Close()
})

$Label = New-Object System.Windows.Forms.Label
$Label.Location = New-Object System.Drawing.Point(100,50)
$Label.Size = '100,100'
$Label.Text = "bonjour"

$Title = New-Object System.Windows.Forms.Label
$Title.Font = [System.Drawing.Font]::new("Microsoft Sans Serif", 12, [System.Drawing.FontStyle]::Bold)
$Title.Location = New-Object System.Drawing.Point(100,30)
$Title.Text = "MonteBot"

MonteBot -sayTheLine "Bonjour maître, Comment allez-vous ? !!!" -rate 0
$Form.controls.AddRange(@($BoutonEducation,$Label,$BoutonGaming,$Title,$BoutonClose))
$Form.ShowDialog()