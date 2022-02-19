$host.ui.RawUI.WindowTitle="Powershell"

Set-Location C:

function prompt
{
  $p = (Get-Location | Get-Item).Name
  "PS $p> "
}

function Get-Ascii {
[cmdletbinding()]

param (
    [switch]$Shrug,
    [switch]$Disapproval,
    [switch]$TableFlip,
    [switch]$TableBack,
    [switch]$TableFlip2,
    [switch]$TableBack2,
    [switch]$TableFlip3,
    [switch]$Denko,
    [switch]$BlowKiss,
    [switch]$Lenny,
    [switch]$Angry,
    [switch]$DontKnow
  )
  $OutputEncoding = [System.Text.Encoding]::unicode

  Switch ($PSBoundParameters.GetEnumerator().
  Where({$_.Value -eq $true}).Key)
  {
    # 'NAME' { [char[]]@() -join '' | clip }
    'Shrug' { [char[]]@(175,92,95,40,12484,41,95,47,175) -join '' | clip}
    'Disapproval' { [char[]]@(3232,95,3232) -join '' | clip }
    'TableFlip' { [char[]]@(40,9583,176,9633,176,65289,9583,65077,32,9531,9473,9531,41) -join '' | clip }
    'TableBack' { [char[]]@(9516,9472,9472,9516,32,175,92,95,40,12484,41) -join '' | clip }
    'TableFlip2' { [char[]]@(9531,9473,9531,32,65077,12541,40,96,1044,180,41,65417,65077,32,9531,9473,9531) -join '' | clip }
    'TableBack2' { [char[]]@(9516,9472,9516,12494,40,32,186,32,95,32,186,12494,41) -join '' | clip }
    'TableFlip3' { [char[]]@(40,12494,3232,30410,3232,41,12494,24417,9531,9473,9531) -join '' | clip }
    'Denko' { [char[]]@(40,180,65381,969,65381,96,41) -join '' | clip }
    'BlowKiss' { [char[]]@(40,42,94,51,94,41,47,126,9734) -join '' | clip}
    'Lenny' { [char[]]@(40,32,865,176,32,860,662,32,865,176,41) -join '' | clip }
    'Angry' { [char[]]@(40,65283,65439,1044,65439,41) -join '' | clip }
    'DontKnow' { [char[]]@(9488,40,39,65374,39,65307,41,9484) -join '' | clip }
  }

}

function Say
{
    param($text,[int]$speed)
        
    $scriptblock = {      
        param($text,[int]$speed)
        add-type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.Rate = $speed
        $speak.SelectVoiceByHints("Female")
        $speak.Speak($text)
    }

    Invoke-Command -ScriptBlock $scriptblock -ArgumentList $text,$speed

}

function SayWav
{
    param($text,[int]$speed,$Wav)
        
    $scriptblock = {      
        param($text,[int]$speed)
        add-type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.Rate = $speed
        $speak.SelectVoiceByHints("Female")
        $speak.SetOutputToWaveFile($Wav)
        $speak.Speak($text)
    }

    Invoke-Command -ScriptBlock $scriptblock -ArgumentList $text,$speed,$Wav

}

function vapor
{
  param($inputString)

  $charArray = $inputString.ToCharArray()
  $newString

  foreach($char in $charArray)
  {
    $newString += "$char "
  }

  $newString = $newString.ToString()
  $newString | clip
  Write-Host $newString
}

function mock
{
  param($inputString)
  
  $charArray = $inputString.ToCharArray()
  $newString

  foreach($char in $charArray)
  { 
    $ran = get-random -maximum 2
    if($ran -eq 0)
    {
      $temp = $char.ToSTring() 
      $newChar = $temp.toUpper() 
      $newString += $newChar 
    }
    else 
    { 
      $newSTring += $char.toString()
    } 
  } 
  $newString = $newString.ToSTring()
  Write-Host $newString
  $newString | clip
}

Import-Module oh-my-posh
oh-my-posh --init --shell pwsh --config ~/git/phill-holbrook/AtomicPH.json | Invoke-Expression
Clear-Host