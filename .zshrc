# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Improve git performance
export DISABLE_UNTRACKED_FILES_DIRTY=false
export GIT_STATUS_IGNORE_SUBMODULES=true
git config --global oh-my-zsh.hide-status 1
git config --global oh-my-zsh.hide-dirty 1
git config --global push.autoSetupRemote true

# Configure git to use status cache
if command -v git >/dev/null 2>&1; then
  git config --global core.preloadindex true
  git config --global core.fscache true
  git config --global gc.auto 256
fi

# NVM
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm without auto-detecting inherited PATH
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use default --silent  # Explicitly activate the default alias
