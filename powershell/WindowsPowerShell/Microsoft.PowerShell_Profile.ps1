# Install scoop if we don't have it installed and install all depencencies.
if (!(Get-Command "scoop")) {
    # Install scoop.
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

    # Install the scoop dependencies.
    scoop bucket add extras
    scoop install neovim wezterm ripgrep sed zoxide starship eza
} 

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
