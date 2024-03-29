# Set up our config directory for neovim and wezterm.
$env:XDG_CONFIG_HOME = "${env:USERPROFILE}/.config"

# Utility make and change directory function.
function mkd($dir) {
    New-Item -ItemType Directory -Force -Path $dir -ErrorAction Stop | Out-Null
    Set-Location -Path $dir
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name ff -Value fzf
Set-Alias -Name lg -Value lazygit

# Add alias for ls and allow extra arguments to be passed
function ls_alias() { eza --icons=auto $args[0] }
function ll_alias() { eza -l --icons=auto $args[0] }
Set-Alias -Name ls -Value ls_alias -Option AllScope
Set-Alias -Name ll -Value ll_alias -Option AllScope

Set-Alias -Name gps -Value btm -Option AllScope -Force
function ps_args() { btm -b $args[0] }
Set-Alias -Name ps -Value ps_args -Option AllScope -Force

# Override the Ctrl+r and Ctrl+f keybinds to use fzf.
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider ‘Ctrl+f’ -PSReadLineChordReverseHistory ‘Ctrl+r’
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

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
