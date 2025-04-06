#!/usr/bin/env zsh
# shellcheck shell=bash
setopt pipefail

DOTFILES_DIRECTORY=$(cd "${0%/*}" && pwd -P)
MACOS=$(uname -a | grep -Fq Darwin 2>/dev/null && echo "MACOS" || echo "")
DEBIAN=$([ -f /etc/debian_version ] && echo "DEBIAN" || echo "")

# Pre-requisites
# - Log in to iCloud
# - Install 1Password from App Store
# - Set up Internet Accounts
# - Install Homebrew

# git
echo -e "\033[1mSetting up Git\033[0m"
ln -fs "${DOTFILES_DIRECTORY}/.gitconfig" "${HOME}/.gitconfig"
ln -fs "${DOTFILES_DIRECTORY}/.gitignore" "${HOME}/.gitignore"
[ -n "${CODESPACES}" ] && git config --global "credential.helper" "cache" && git update-index --skip-worktree "${DOTFILES_DIRECTORY}/.gitconfig"
echo -e "\033[1mGit setup complete\033[0m\n"

# shell
echo -e "\033[1mSetting up Zsh\033[0m"
[ -n "${CODESPACES}" ] && sudo chsh -s $(which zsh) $(whoami)
ln -fs "${DOTFILES_DIRECTORY}/.zshrc" "${HOME}/.zshrc"
[ -n "${CODESPACES}" ] && ln -nfs "/workspaces" "${HOME}/Developer"
[ -n "${CODESPACES}" ] && [ ! -d "/workspaces/dotfiles" ] && ln -nfs "${DOTFILES_DIRECTORY}" "/workspaces/dotfiles"
echo -e "\033[1mZsh setup complete\033[0m\n"
