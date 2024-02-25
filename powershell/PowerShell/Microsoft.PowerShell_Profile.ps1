# Install scoop if we don't have it installed and install all depencencies.
if (!(Get-Command "scoop")) {
    # Install scoop.
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

    # Install the scoop dependencies.
    scoop bucket add extras
    scoop install neovim wezterm ripgrep sed zoxide starship eza
} 

# Set up our config directory for neovim and wezterm.
$env:XDG_CONFIG_HOME = "${env:USERPROFILE}/.config"

# Utility make and change directory function.
function mkd($dir) {
    New-Item -ItemType Directory -Force -Path $dir -ErrorAction Stop | Out-Null
    Set-Location -Path $dir
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name ls -Value eza -Option AllScope
Set-Alias -Name ff -Value fzf

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init --cmd=cd powershell | Out-String) })
