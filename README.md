# Dotfiles

This directory contains the dotfiles for Linux-based system.

## Requirements

Ensure you have the following installed on your system.

### Git

```
(Ubuntu)$ sudo apt install git
(Mac)$ brew install git
```

### Stow

```
(Ubuntu)$ sudo apt install stow
(Mac)$ brew install stow
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
```
