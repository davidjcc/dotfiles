# dotfiles

My Windows, powershell, nvim, and wezterm dotfiles.

To use these dotfiles you need to set the powershell profile directory via the following command:

```powershell
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'
    Personal -Value "%USERPROFILE%/.config/powershell/" -Type ExpandString -Force
```

This will set the powershell profile load location to `$USERPROFILE%/.config/powershell`.

Then install the latest powershell version and powershell dependencies:

```powershell
winget install Microsoft.Powershell
Install-Module PSReadLine -Force
Install-Module PSFzf -Force
```
I use [scoop](https://scoop.sh) as my dependency manager. To install:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

The following dependencies are required to be installed, either via scoop or your package manager
of choice:

- A C/C++ compiler (cl, clang, gcc, or zig)
- ripgrep
- sed
- zoxide
- starship
- eza
- bottom

```powershell
scoop install neovim wezterm ripgrep sed starship eza bottom zig
```
