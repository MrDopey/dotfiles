# Installation


disable secure boot
restart if there is a failed installation



Link: https://wiki.cachyos.org/installation/installation_on_root/
Create a new partition with the following:

Size: 2048MiB
Filesystem: FAT32
Mount point: /boot
Flags: boot

Create another partition for root:
Size: At least 20000MiB
Filesystem: Any, refer Filesystem
Mount point: /
Flags: (none)

# Setup

## dotfiles

```shell
rm -rf ~/.profiles ~/.zshrc ~/.bashrc ~/.config/hypr/
# cd dotfiles
# stow .
````

## zsh

install zsh and then the theme

## yay

```shell
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

Link: https://github.com/Jguer/yay

## packages

```shell
# official wezterm is old version 20240203-110809-5046fc22
sudo pacman --sync \
    dolphin \
    flatpak \
    gparted \
    hypridle \
    hyprsunset \
    kde-cli-tools \
    keepassxc \
    pyenv \
    rpi-imager \
    thunderbird \
    tk \
    nvim \
    stow


yay --sync \
    spotify \
    xp-pen-tablet \
    wezterm-nightly-bin

flatpak install flathub \
    com.bambulab.BambuStudio \
    com.discordapp.Discord \
    com.logseq.Leu.betterbird.Betterbirdogseq \
    com.google.Chrome \
    com.valvesoftware.Steam \
    eu.betterbird.Betterbird \
    io.anytype.anytype \
    io.github.ilya_zlobintsev.LACT \
    md.obsidian.Obsidian \
    org.kde.krita \
    us.zoom.Zoom
```

### LACT

first time opening the app, will require installing some daemons

https://github.com/ilya-zlobintsev/LACT/blob/master/flatpak/README.md

### Logseq

To make dark theme stick 

- Settings -> Change theme
- then ctrl + k -> Select avaiable theme -> hit enter (should only be dark)

https://github.com/logseq/logseq/issues/6768#issuecomment-1506302832


### nix

```shell
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

https://nixos.org/download/

To clean up

```shell
nix-store --gc
```

https://nixos.wiki/wiki/Cleaning_the_nix_store

## Set DNS globally


### Suppress the dhcp server dns lookup

```sh
# Get the name of the connection
nmcli conn
# Do not use dns
nmcli con mod 'Wired connection 1' ipv4.ignore-auto-dns yes
```

Tell the networkmanager config to not manage the resolve file

### Neuter network manager

```
# /etc/NetworkManager/NetworkManager.conf
[main]
dns=none
```

### Manually configure the dns

```
# /etc/resolv.conf
# Manual configuration with custom DNS servers

nameserver 192.168.8.202
nameserver 1.1.1.1

# Optional search domain (replace with your domain)
# search example.com

# Optional settings
options timeout:2
options attempts:3
```

### Restart everything

```sh
systemctl restart NetworkManager
systemctl restart systemd-resolved.service
resolvectl flush-caches
```

### Help / Troubleshooting

Commands
- resolvectl status
- resolvectl show-cache
- nmcli dev show

Links
- Arch DNS: https://wiki.archlinux.org/title/Domain_name_resolution#Application-level_DNS
- Networkmanager manual: https://www.networkmanager.dev/docs/api/latest/NetworkManager.conf.html
- systemd-resolved: https://wiki.archlinux.org/title/Systemd-resolved
- DNS with resolver.conf https://bbs.archlinux.org/viewtopic.php?id=270132
- https://man.archlinux.org/man/systemd-resolved.8#/ETC/RESOLV.CONF
- https://man.archlinux.org/man/resolv.conf.5.en

# Help

## gparted

from terminal `sudo -E gparted`
