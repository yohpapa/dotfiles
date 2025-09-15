#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|

# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
export HISTSIZE=5000
export HISTFILE=$HOME/.cache/zsh/history
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
# Note:
# Completions should be configured before compinit, as stated in the zsh-completions manual
# installation guide. -- https://github.com/Aloxaf/fzf-tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --all $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza --icons=always --all $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always -all $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 100 20

# Auto-completion setup
autoload -Uz compinit && compinit
_comp_options+=(globdots)  # Include hidden files
zinit cdreplay -q

# Aliases
alias ls='eza --icons=always'
alias ll='eza --icons=always --long'
alias la='eza --icons=always --all'
alias tree='eza -T'
alias cat='bat'
alias c='clear'
alias vi='nvim'
# Not ready yet
# alias top='btop'

# Install plugins
# Note: fzf-tab needs to be loaded after compinit, but before plugins which
# wil wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
# -- https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Starship
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# General environment
export EDITOR="nvim"
export PATH=$PATH:$HOME/go/bin:$HOME/.local/scripts

# Shell integrations
# eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)" 
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

# Other configurations
[ -e $HOME/.cargo/env ] && source $HOME/.cargo/env
[ -e $ZDOTDIR/office.zsh ] && source $ZDOTDIR/office.zsh 
[ -e $ZDOTDIR/home.zsh ] && source $ZDOTDIR/home.zsh 
[ -f $HOME/.ghcup/env ] && . $HOME/.ghcup/env # ghcup-env

# yazi configuration
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
