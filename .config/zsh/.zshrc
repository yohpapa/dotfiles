# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Completion styling
# Note:
# Completions should be configured before compinit, as stated in the zsh-completions manual
# installation guide. -- https://github.com/Aloxaf/fzf-tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'

# Auto-completion setup
autoload -Uz compinit && compinit
_comp_options+=(globdots)  # Include hidden files

# Install plugins

# Note:
# fzf-tab needs to be loaded after compinit, but before plugins which will
# wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
# -- https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add snippets
# -- Snippets do not work at all for some reaosn.
# zinit snippet OMZP::command-not-found
# zinit snippet OMZP::sudo
# zinit cdreplay -q

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

# Fzf
[ -f $HOME/.config/fzf/.fzf.zsh ] && source $HOME/.config/fzf/.fzf.zsh

# Rust setup
. "$HOME/.cargo/env"

# Starship
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Aliases
alias ls='exa --icons'
alias ll='exa --icons --long'
alias la='exa --icons --all'
alias tree='exa -T'
alias cat='bat'
alias c='clear'
# alias top='btop'
# alias vi='nvim'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(starship init zsh)" 
eval "$(zoxide init --cmd cd zsh)"
