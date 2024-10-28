# .dotfiles

Clone into home directory --> ```cd .dotfiles && stow .``` 

## Arch Install

**Profile:**
- Desktop - Hyprland

**Additional Packages:**
```bash 
pavucontrol rofi git vim neovim stow wget unzip flatpak ranger hyprpaper waybar neofetch kitty bluez bluez-utils
```

## Useful Commands

**Wifi:**
```bash 
# List networks
nmcli d wifi list

# Connect to network
nmcli d wifi connect <SSID> password <password>

# Disconnect from network
nmcli con down id <SSID>
```

**Bluetooth:**
```bash 
# Check that BT module is running
lsmod | grep btusb

# Start/enable BT service
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

bluetoothctl 
```


