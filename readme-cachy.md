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
    hyprsunset \
    keepassxc \
    pyenv \
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
    com.valvesoftware.Steam \
    eu.betterbird.Betterbird \
    io.anytype.anytype \
    io.github.ilya_zlobintsev.LACT \
    md.obsidian.Obsidian \
    org.kde.krita
```

### LACT

first time opening the app, will require installing some daemons

https://github.com/ilya-zlobintsev/LACT/blob/master/flatpak/README.md

### Logseq

To make dark theme stick 

- Settings -> Change theme
- then ctrl + k -> Select avaiable theme -> hit enter (should only be dark)

https://github.com/logseq/logseq/issues/6768#issuecomment-1506302832

# Help

## gparted

from terminal `sudo -E gparted`
