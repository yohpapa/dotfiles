# Dotfiles

This directory contains the dotfiles for Linux-based system.

## Requirements

Ensure you have the following installed on your system.

### Git

```
apt install git
brew install git
```

### Stow

```
apt install stow
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git.

```
git clone https://github.com/yohpapa/dotfiles.git
cd dotfiles
```

then use GNU stow to creat symlinks.

```
stow .
```
