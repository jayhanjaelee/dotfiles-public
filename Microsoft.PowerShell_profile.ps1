function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

$out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
  return $out
}

# aliases

Set-Alias vim nvim
Set-Alias vi nvim
Set-Alias v nvim
Set-Alias tail tail-tail

# cd
Set-Alias wamp cd_wamp
Set-Alias des cd_desktop
Set-Alias doc cd_doc
Set-Alias down cd_down
Set-Alias univ cd_univ

function cd_wamp {
    Set-Location "C:\wamp64"
}

function cd_desktop {
    Set-Location "$HOME\Desktop"
}

function cd_doc {
    Set-Location "$HOME\Documents"
}

function cd_down {
    Set-Location "$HOME\Downloads"
}

function cd_univ {
    Set-Location "d:\univ"
}

function tail-file {
    param (
        [string]$filename
    )
    
    Get-Content -Path $filename -Wait -Tail 0
}
