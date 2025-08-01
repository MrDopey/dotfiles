
# brew

https://brew.sh/

```
brew bundle dump --force --file=~/dotfiles/untracked/brewfile
brew bundle install --file=~/dotfiles/untracked/brewfile
```

Install the following
- gnu stow
- tmux 3.1+, this config depends on XDG config directory (https://github.com/tmux/tmux/issues/142#issuecomment-586116296)
- tmux package manager `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

```shell
cd ~/<dotfiles>
touch secrets.sh
chmod +x secrets.sh
stow .
```

Once inside a tmux shell, install the packages
```
<c-b>I
```

Download zsh theme
```shell
curl -o ~/.oh-my-zsh/themes/nuts.zsh-theme https://raw.githubusercontent.com/rafaelsq/nuts.zsh-theme/master/nuts.zsh-theme
```

```shell
git config --global user.name 'MrDopey'
git config --global user.email beforewards@gmail.com
```

# Manual step

## Terminal

### ssh keys


```shell
/ssh-keygen -t ed25519 -C "beforewards@gmail.com" -f ~/.ssh/id_ed25519_dopey
```

### node 

```
nvm install 22
```

### Oh my zsh

https://ohmyz.sh/#install


### Iterm2 settings

Export / import: https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles

Manual changes

- Profiles -> keys -> key mappings -> Natural text editing
- Removing "Send Hex Codes: 0x4" Allow deleting forward: https://superuser.com/questions/1743138/strange-behavior-of-delete-key-in-vim-on-iterm-mac
- Replace ⌥+←Delete with 0x17, https://stackoverflow.com/questions/6205157/how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line

## Docker settings

### Enable host networking

Resources => Network => Enable host networking

https://github.com/docker/for-mac/issues/7448

### Add dns config

Add to the deamon.json ~/.docker/daemon.json, or the 'Docker Engine' option in the UI

```sh
  "dns": ["1.1.1.1", "8.8.8.8"],
```

https://stackoverflow.com/questions/61760047/docker-build-npm-install-error-network-timeout

### Disable containerd

General -> Use containerd for pulling and storing images (uncheck)

https://stackoverflow.com/questions/76355896/docker-build-platform-linux-amd64-fails-error-failed-to-solve-no-match-for

### host.docker.internal

In dev container

```json
	"runArgs": ["--add-host", "host.docker.internal:host-gateway"],
```

In cli 
```sh 
--add-host host.docker.internal:host-gateway
```


https://dev.to/fmtweisszwerg/docker-how-to-fix-host-not-found-in-upstream-hostdockerinternal-37od
https://echorand.me/posts/docker-extra-hosts/

## mac settings

- Accessibility
    - Display
        - (enable) Reduce motion

- Desktop & dock
    - (disable) Automatically rearrange spaces based on most recent use
    - (enable) Automatically hide and show the Dock

- Keyboard
    - Text input, input sources
        - Add colemak
        - (enable) show input menu in menu bar
        - (disable) automatically switch to a document's input source
        - (disable) Correct spelling automatically
        - (disable) Capitalise words automaticaly
        - (enable) show inline predictive text
        - (disable) Add full stop with double spaces
        - (disable) use smarp quotes and dashes
    - keyboard shortcuts
        - Function keys
            - (disable) Use F1, F2, etc keys as standard function keys
        - Input sources
            - (disable) Select the previous input source
            - (disable) Select next source in input menu
        - Mission control
            - Mission control, switch to Desktop X
    - Dictation
        - Shortcut, change to press micphone

- Privacy & Security
    - Files and Folders
        - Iterm2
            - Desktop folder
            - Downloads folder
        - keepassxc
            - Google drive
        - vscode

- Screen saver
    - Lock screen settings
        - Start screen saver when inactive - for 2 minutes
        - Turn display off on battery when inactive - for 2 minutes
        - Turn display off on power adapter when inactive - for 5 minutes
        - Require password after screen saver begins or display is turned off - immediately
        - show large clock - on screen saver and lock screen
        - (enable) show 24 hrs time

## Remapping keys

Remap capslock

```shell
launchctl load -w ~/Library/LaunchAgents/com.local.KeyRemapping.plist
launchctl unload ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# To verify
hidutil property --get "UserKeyMapping"
```

- https://github.com/amarsyla/hidutil-key-remapping-generator
- https://gist.github.com/sundeepgupta/5a9b1e9c5dec4916863aade55a7d6aed

## Finder

Show hidden files

Open finder -> cmd + shift + . (period)

## wsl

### Hardcode dns

`sudo vi /etc/wsl.conf`

```toml
[network]
generateResolvConf = false
```

Then edit `sudo vi /etc/resolv.conf`

```toml
nameserver 8.8.8.8
````

https://superuser.com/questions/1533291/how-do-i-change-the-dns-settings-for-wsl2


### Install python virtual environment

```shell
curl -fsSL https://pyenv.run | bash

# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt update; sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

pyenv latest -k 3.12
pyenv install 3.12.11
pyenv global 3.12.11
# pyenv shell 3.12.11
```

- https://github.com/pyenv/pyenv

### Install nix

Single user install

```shell
$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

Links
- https://nixos.org/download/#download-nix
- Mapping of specific package version to nixos pkg version https://lazamar.co.uk/nix-versions/?channel=nixos-25.05&package=go
- Search packages normally https://search.nixos.org/packages?channel=25.05&from=0&size=50&sort=relevance&type=packages
- `echo $IN_NIX_SHELL`

### Install wezterm

set `XDG_CONFIG_HOME` environment varible to the wsl location e.g. `\\wsl$\Ubuntu-20.04\home\rex\dotfiles\.config`

```shell
# To debug
ctrl + shift + l
# check config file location
wezterm.config_file
```

# Helpful

## Tmux

Force kill tmux server
```shell
sudo kill -9 $(pgrep -f tmux)
```

## vscode

if having trouble picking up zsh shell

cmd + shift + p -> select default profile

## Aerospace

https://www.youtube.com/watch?v=-FoWClVHG5g

https://www.josean.com/posts/how-to-setup-aerospace-tiling-window-manager

---

# References 

https://unix.stackexchange.com/questions/122475/human-readable-memory-sizes-in-top
`top` setting, use `e` and `E` (top line) then `W` to write the setttings.
