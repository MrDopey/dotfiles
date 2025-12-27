# brew

https://brew.sh/

```
brew bundle dump --force --file=~/dotfiles/untracked/brewfile
brew bundle install --file=~/dotfiles/untracked/brewfile
```

# Terminal


## Iterm2 settings

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

## Podman

```sh
podman machine init
podman machine start
```

https://podman.io/docs/installation#macos

# mac settings

- Accessibility
    - Display
        - (enable) Reduce motion

- Apple intelligence and Siri
    - Disable

- Desktop & dock
    - (disable) Automatically rearrange spaces based on most recent use
    - (enable) Automatically hide and show the Dock

- Spotlight
    - (disable) Show Related Content
    - as needed, disable 'Results from apps'
    - Result from System
        - (disable) Folders
        - (disable) IPhone apps
    - Search Privacy (blacklist certain folders from being indexed by spotlight)
        - dotfiles
        - sandbox
        - test
        - untracked

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
    - Local network
        - Chrome
        - Firefox
        - Wezterm
    - Apple intelligence report - off

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

## Nix

```shell
$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

- https://nixos.org/download/#nix-install-macos

## Spotlight

### Add alt firefox profile

- Create an Automator Application
- Open Automator → New Document → Application.
- Add an action: Run Shell Script.
- Paste something like this (replace MyProfile with your Firefox profile name):
    - `open -na "Firefox" --args -P "MyProfile" --no-remote`
    - `-na` ensures a new instance is launched.
    - `P` picks a specific profile.
    - `--no-remote` prevents reuse of an already running Firefox instance.
- Save it as something like Firefox Work.app in your `/Applications` or `~/Applications` folder.
- Spotlight automatically indexes apps in `/Applications` and `~/Applications`.
- If it doesn’t show up, go to System Settings → Siri & Spotlight → Spotlight Privacy, remove your Applications folder if it’s excluded.

- https://chatgpt.com/c/68bf81a7-3008-8329-bb16-0962e935b432

# Helpful

## Aerospace

https://www.youtube.com/watch?v=-FoWClVHG5g

https://www.josean.com/posts/how-to-setup-aerospace-tiling-window-manager
