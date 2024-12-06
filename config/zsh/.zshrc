# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# brew install pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# brew install starship
eval "$(starship init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Path to your oh-my-zsh installation.
export WORKSPACE="$HOME/workspace"

alias workspace="cd $WORKSPACE"
alias dev="cd ~/Development"
alias tct="cd ~/Development/tct"
alias obsidian="cd ~/Obsidian/EdgeVault" 

export NVM_DIR="$HOME/.nvm"

src(){
  source venv/bin/activate
  source .env
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/edge/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/edge/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/edge/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/edge/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
