# Set up our config directory
$env:XDG_CONFIG_HOME = "${env:USERPROFILE}/.config"

Set-Alias vim nvim
Set-Alias vi nvim

function mkd($dir) {
    New-Item -ItemType Directory -Force -Path $dir -ErrorAction Stop | Out-Null
    Set-Location -Path $dir
}

Set-Alias -Name ls -Value eza -Option AllScope

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
