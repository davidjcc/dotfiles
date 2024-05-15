# Ensure the console has the correct encoding
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Set up our config directory for neovim and wezterm.
$env:XDG_CONFIG_HOME = "C:\dev\.config"

# 3rd Party Scripts
$InstalledScripts = "$env:XDG_CONFIG_HOME\powershell\Powershell\Scripts";
. "$InstalledScripts\P4Utils.ps1";
. "$InstalledScripts\Utils.ps1";
. "$InstalledScripts\CMake.ps1";
. "$InstalledScripts\Make.ps1";
. "$InstalledScripts\Get-EnvironmentVariable.ps1";
. "$InstalledScripts\Get-EnvironmentVariableNames.ps1";
. "$InstalledScripts\Update-SessionEnvironment.ps1";

# Utility make and change directory function.
function mkd($dir) {
    New-Item -ItemType Directory -Force -Path $dir -ErrorAction Stop | Out-Null
    Set-Location -Path $dir
}

# Alias for wezterm imgcat
function imgcat($path) { wezterm imgcat $path }
Set-Alias -Name p4f -Value P4Fzf
Set-Alias -Name p4c -Value P4SelectClient
Set-Alias -Name p4g -Value P4SearchAndDownloadProject
Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name ff -Value fzf
Set-Alias -Name lg -Value lazygit

# Add alias' for 'ls' and 'll' and allow extra arguments to be passed
function ls_alias() { eza -l -a --icons=auto --group-directories-first $args[0] }
Set-Alias -Name ls -Value ls_alias -Option AllScope

function ll_alias() { eza -a --icons=auto --group-directories-first $args[0] }
Set-Alias -Name ll -Value ll_alias -Option AllScope

Set-Alias -Name gps -Value btm -Option AllScope -Force
function ps_args() { btm -b $args[0] }
Set-Alias -Name ps -Value ps_args -Option AllScope -Force

# Override the Ctrl+r and Ctrl+f keybinds to use fzf.
# Set-PsFzfOption -PSReadLineChordProvider ‘Ctrl+f’ -PSReadLineChordReverseHistory ‘Ctrl+r’
# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init --cmd=cd powershell | Out-String) })
