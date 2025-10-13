# Dotfiles

This directory contains the dotfiles for Debian-based system.

## Requirements

Complete OS installation. See https://github.com/yohpapa/nixos_configs for detail.

## Installation

First, check out the dotfiles repo in your $HOME directory using git.

```
$ git clone https://github.com/yohpapa/dotfiles.git
$ cd dotfiles
```

then use GNU stow to creat symlinks.

```
$ stow (module)
```

The module is a name of the directory which you want to stow in `$HOME/.config`.

## Post-installations (if needed)

### tmux module (required)

Clone the below projects.

```
$ mkdir -p $HOME/.config/tmux/plugins
$ git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
```

Don't forget to install tmux plugins with `Ctrl-U`+I.

### ghostty module (optional)

Download shaders from the below and put them in `$HOME/.config/ghostty/shaders`.

- Background: https://github.com/hackr-sh/ghostty-shaders/tree/main
- Cursor: https://github.com/KroneCorylus/ghostty-shader-playground/tree/main/shaders

### hyprland module

Download animation configs from https://github.com/HyDE-Project/HyDE/tree/master/Configs/.config/hypr/animations, then put them in `$HOME/.config/hypr/animations/`.

### hyprland and niri modules

Download cursor themes from https://github.com/ful1e5, unzip them and put them in `$HOME/.local/share/icons`.

### yazi module

Clone the below projects.

```
$ mkdir -p $HOME/.config/yazi/flavors
$ git clone https://github.com/BennyOe/tokyo-night.yazi.git @HOME/.config/yazi/flavors/tokyo-night.yazi
```

### systemd module

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
