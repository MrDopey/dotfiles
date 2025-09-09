# Hardcode dns

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

# Install python virtual environment

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

# Install nix

Single user install

```shell
$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

## Install wezterm

set `XDG_CONFIG_HOME` environment varible to the wsl location e.g. `\\wsl$\Ubuntu-20.04\home\rex\dotfiles\.config`

```shell
# To debug
ctrl + shift + l
# check config file location
wezterm.config_file
```

