
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


# Helpful

Force kill tmux server
```shell
sudo kill -9 $(pgrep -f tmux)
```
