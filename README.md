
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

# Helpful

Force kill tmux server
```shell
sudo kill -9 $(pgrep -f tmux)
```


---

# References 

https://unix.stackexchange.com/questions/122475/human-readable-memory-sizes-in-top
`top` setting, use `e` and `E` (top line) then `W` to write the setttings.
