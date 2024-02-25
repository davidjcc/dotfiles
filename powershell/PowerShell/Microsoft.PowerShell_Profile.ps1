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
Set-Alias -Name lg -Value lazygit

Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider ‘Ctrl+f’ -PSReadLineChordReverseHistory ‘Ctrl+r’

# Build the current directory. TODO: Replace the dotnet build with whatever
# build command we want to use.
# Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
# -BriefDescription BuildCurrentDirectory `
# -LongDescription “Build the current directory” `
# -ScriptBlock {
#    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
#    [Microsoft.PowerShell.PSConsoleReadLine]::Insert(“dotnet build”)  
#    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
# }

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init --cmd=cd powershell | Out-String) })
