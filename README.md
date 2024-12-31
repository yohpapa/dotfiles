# Dotfiles

This directory contains the dotfiles for Debian-based system.

## Requirements

Ensure you have the following installed on your system.

```
$ sudo add-apt-repository ppa:neovim-ppa/unstable
$ sudo apt update
$ sudo apt install neovim git stow fzf libgmp3-dev ripgrep npm
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git.

```
$ git clone https://github.com/yohpapa/dotfiles.git
$ cd dotfiles
```

then use GNU stow to creat symlinks.

```
$ stow .
```

## Post-installations

Copy the udev rule in the repository to /etc/udev/rule.d.

```
$ cp .config/systemd/user/80-xremap.rules /etc/udev/rule.d/
```

then start a new system service with the following.

```
$ systemctl --user daemon-reload
$ systemctl --user start xremap
$ systemctl --user enable xremap
```

Clone the below projects.

```
$ cd $HOME/.config/tmux/plugins
$ git clone https://github.com/tmux-plugins/tpm plugins/tpm
$ cd /tmp
$ git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
$ cd pokemon-colorscripts
$ sudo ./install.sh
```

Don't forget to install tmux plugins with `Ctrl-U`+I.
