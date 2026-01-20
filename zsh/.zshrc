# ─────────────────────────────────────────────────────────────
# Homebrew
# ─────────────────────────────────────────────────────────────
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ─────────────────────────────────────────────────────────────
# Zinit Plugin Manager
# ─────────────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# ─────────────────────────────────────────────────────────────
# History
# ─────────────────────────────────────────────────────────────
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# ─────────────────────────────────────────────────────────────
# Shell Options
# ─────────────────────────────────────────────────────────────
setopt autocd              
setopt correct             
setopt interactive_comments 

# ─────────────────────────────────────────────────────────────
# Key Bindings
# ─────────────────────────────────────────────────────────────
bindkey -e                           
bindkey '^p' history-search-backward 
bindkey '^n' history-search-forward  
bindkey '^[[A' history-search-backward 
bindkey '^[[B' history-search-forward  

# ─────────────────────────────────────────────────────────────
# Completion Styling
# ─────────────────────────────────────────────────────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 
zstyle ':completion:*' menu select                      

# ─────────────────────────────────────────────────────────────
# PATH
# ─────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Python/3.12/bin:$PATH"
export PATH="$(brew --prefix python@3.12)/libexec/bin:$PATH"
export PATH="$(brew --prefix postgresql@16)/bin:$PATH"
export PATH="/Users/hedmana/.antigravity/antigravity/bin:$PATH"

# ─────────────────────────────────────────────────────────────
# NVM (lazy-loaded for faster shell startup)
# ─────────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm node npm npx
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
  [ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
  nvm "$@"
}

node() { nvm; node "$@"; }
npm() { nvm; npm "$@"; }
npx() { nvm; npx "$@"; }

# ─────────────────────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────────────────────
alias python="python3"
alias pip="pip3"
alias ll="ls -lah"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."

# ─────────────────────────────────────────────────────────────
# Starship Prompt (load last)
# ─────────────────────────────────────────────────────────────
eval "$(starship init zsh)"
