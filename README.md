# dotfiles
My powershell, neovim and wezterm dotfiles.

I am currently using these with powershell on windows which requires `XDG_CONFIG_HOME` 
to be set in your powershell profile to wherever you clone this repo to. For example, if we
clone this to `${USERPROFLE}.config`:

This config will require you to edit your powershell profile directory (in this example it will be `${USERPROFILE}/.config/powershell`:
```pwsh
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value "%USERPROFILE%/.config/powershell/" -Type ExpandString -Force
winget install Microsoft.Powershell
Install-Module psreadline -Force
Install-Module PSFzf -Force
```
### Dependencies
The neovim config requires the following to be installed:
- scoop
- A C/C++ compiler
- ripgrep
- sed
- zoxide
- starship
- eza
- bottom
