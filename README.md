# CATPPUCCIN

Powershell/WSL: https://github.com/catppuccin/windows-terminal

# OH MY POSH

URL: https://ohmyposh.dev/docs

## Powershell

**Install**

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

**Profile config**

1. Open profile config:

```powershell
code $PROFILE # may have to create profile first: New-Item -Path $PROFILE -Type File -Force
```
2. Add the following line: 

```powershell
oh-my-posh init pwsh --config 'C:\Users\axelh\AppData\Local\Programs\oh-my-posh\themes\catppuccin_mocha.omp.json' | Invoke-Expression
```

## Linux

**Install**

```bash
sudo curl -s https://ohmyposh.dev/install.sh | sudo bash -s
```

**Profile config**

- Add the following line to .bashrc:

```powershell
eval "$(oh-my-posh init bash --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_mocha.omp.json')"
```