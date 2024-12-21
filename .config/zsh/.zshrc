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
zinit cdreplay -q

# Aliases
alias ls='exa --icons=always'
alias ll='exa --icons=always --long'
alias la='exa --icons=always --all'
alias tree='exa -T'
alias cat='bat'
alias c='clear'
# Not ready yet
# alias vi='nvim'
# alias top='btop'

# Install plugins
# Note: fzf-tab needs to be loaded after compinit, but before plugins which
# wil wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
# -- https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Rust
. "$HOME/.cargo/env"

# Starship
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Shell integrations
eval "$(starship init zsh)" 
eval "$(zoxide init --cmd cd zsh)"
# Note: https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
# eval "$(fzf --zsh)"
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

