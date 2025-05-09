

$env:LC_ALL='C.UTF-8'
$OutputEncoding = [System.Text.Encoding]::UTF8

[System.Environment]::SetEnvironmentVariable('ssh','C:\Users\Wonsh\.ssh\config')
[System.Environment]::SetEnvironmentVariable('hosts','C:\Users\Wonsh\Desktop\hosts')
[System.Environment]::SetEnvironmentVariable('vhosts','C:\Users\Wonsh\Desktop\httpd-vhosts.conf')

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
Set-Alias tail tail-file

# cd
Set-Alias wamp cd_wamp
Set-Alias des cd_desktop
Set-Alias doc cd_doc
Set-Alias down cd_down
Set-Alias univ cd_univ

# ls
Set-Alias ll ls_ltr

Set-Alias nvim_conf cd_nvim_conf

function ls_ltr {
  Get-childItem | Sort-Object LastAccessTime
}

function cd_nvim_conf {
    Set-Location "C:\Users\wonsh\AppData\Local\nvim"
}

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

function Update-TabTitle {
    $host.UI.RawUI.WindowTitle = "$(Get-Location)"
}

function prompt {
    Update-TabTitle
    return "PS $(Get-Location)> "
}
