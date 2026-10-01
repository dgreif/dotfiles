# Improve git performance (must be set before oh-my-zsh.sh is sourced)
export DISABLE_UNTRACKED_FILES_DIRTY=true
export GIT_STATUS_IGNORE_SUBMODULES=true

# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# NVM (lazy-loaded: sourcing nvm.sh eagerly adds ~150-200ms to every shell
# startup, so defer it until nvm/node/npm/npx is actually used)
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  _load_nvm() {
    unset -f nvm node npm npx
    \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm without auto-detecting inherited PATH
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm use default --silent  # Explicitly activate the default alias
  }
  nvm() { _load_nvm; nvm "$@"; }
  node() { _load_nvm; node "$@"; }
  npm() { _load_nvm; npm "$@"; }
  npx() { _load_nvm; npx "$@"; }
fi
