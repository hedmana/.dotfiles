# PATH setup
export PATH="$(brew --prefix python@3.12)/libexec/bin:/opt/homebrew/bin:$PATH"
export PATH="$HOME/Library/Python/3.12/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Aliases
alias python="python3"
alias pip="pip3"

# Starship
eval "$(starship init zsh)"