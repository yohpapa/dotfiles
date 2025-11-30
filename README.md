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

### tmux module

Clone the below projects.

```
$ mkdir -p $HOME/.config/tmux/plugins
$ git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
```

Don't forget to install tmux plugins with `Ctrl-U`+I.

### ghostty module

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

**IMPORTANT**: Update an absolute path to each `*.service` file.

```sh
$ cd $HOME/dotfiles
$ stow systemd
$ systemctl --user daemon-reload
$ systemctl --user enable set-dark-theme.timer set-light-theme.timer apply-theme-on-login.service
$ systemctl --user start set-dark-theme.timer set-light-theme.timer apply-theme-on-login.service
```

### PWA for favorite web services

1. Install [PWAsForFirefox extension](https://addons.mozilla.org/en-US/firefox/addon/pwas-for-firefox/) on Firefox.
2. Create a symlink.

```sh
$ find /nix/store -name firefoxpwa.json
...
/nix/store/[HASH]-firefoxpwa-[VERSION]/lib/mozilla/native-messaging-hosts/firefoxpwa.json
^C
$ ln -sf /nix/store/[HASH]-firefoxpwa-[VERSION]/lib/mozilla/native-messaging-hosts/firefoxpwa.json ~/.mozilla/native-messaging-hosts/firefoxpwa.json
```

3. Open a favorite page on Firefox and confirm the app-id for its app-id.

```sh
$ niri msg windows
...
Window ID 12:
  Title: "Google Search"
  App ID: "[HASH]"
  Is floating: no
  PID: 63286
  Workspace ID: 1
...
```

4. Finally update `$HOME/.config/niri/config.kdl` with the above hash.

```kdl
# ...
window-rule {
  # ...
  match app-id="^[HASH]$"
  # ...
  open-floating true
}
# ...
```
