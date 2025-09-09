# Apps

## Terminal

https://ohmyz.sh/#install

Download zsh theme
```shell
curl -o ~/.oh-my-zsh/themes/nuts.zsh-theme https://raw.githubusercontent.com/rafaelsq/nuts.zsh-theme/master/nuts.zsh-theme
```

## tmux

Install the following
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

## ssh keys

```shell
/ssh-keygen -t ed25519 -C "beforewards@gmail.com" -f ~/.ssh/id_ed25519_dopey
```



https://github.com/rktr1998/zig-wol

## Git

```shell
git config --global user.name 'MrDopey'
git config --global user.email beforewards@gmail.com
```

## node 

```
nvm install 22
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

## Nix

- https://nixos.org/download/#download-nix
- Mapping of specific package version to nixos pkg version https://lazamar.co.uk/nix-versions/?channel=nixos-25.05&package=go
- Search packages normally https://search.nixos.org/packages?channel=25.05&from=0&size=50&sort=relevance&type=packages
- `echo $IN_NIX_SHELL`

---

# References 

https://unix.stackexchange.com/questions/122475/human-readable-memory-sizes-in-top
`top` setting, use `e` and `E` (top line) then `W` to write the setttings.
