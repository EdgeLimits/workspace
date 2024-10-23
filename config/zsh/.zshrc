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

# celery -A scheduler worker -l info --pool prefork -Q celery


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ekr/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ekr/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ekr/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ekr/google-cloud-sdk/completion.zsh.inc'; fi
# Function to load NVM if it's not already loaded

export NVM_DIR="$HOME/.nvm"

load_nvm() {
  if [ -z "$NVM_DIR" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi
}

# Function to find the .nvmsrc file by searching the current and parent directories
find_nvmrc() {
  local dir="$PWD"
  while [ "$dir" != "/" ]; do
    if [ -f "$dir/.nvmsrc" ]; then
      echo "$dir/.nvmsrc"
      return
    fi
    dir=$(dirname "$dir")
  done
  return 1
}

# Function to load the node version from .nvmsrc
load_nvmrc() {
  local nvmrc_path
  nvmrc_path="$(find_nvmrc)"
  echo $nvmrc_path

  if [ -n "$nvmrc_path" ]; then
    load_nvm
    local nvm_version
    nvm_version=$(cat "$nvmrc_path")
    if [ "$nvm_version" = "$(nvm version)" ]; then
      return
    elif nvm install "$nvm_version"; then
      nvm use "$nvm_version"
    fi
  fi
}


source_env(){
  source venv/bin/activate
  source .env
}
