#!/usr/bin/env bash

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

ln -sfv "${DOTFILES_DIR}/git/.gitconfig" ~
ln -sfv "${DOTFILES_DIR}/git/.gitignore_global" ~

ln -sfv "${DOTFILES_DIR}/runcom/.bash_profile" ~
ln -sfv "${DOTFILES_DIR}/runcom/.bashrc" ~
ln -sfv "${DOTFILES_DIR}/runcom/.inputrc" ~

ln -sfv "${DOTFILES_DIR}/system/.alias" ~
ln -sfv "${DOTFILES_DIR}/system/.env" ~
ln -sfv "${DOTFILES_DIR}/system/.export" ~
ln -sfv "${DOTFILES_DIR}/system/.extra" ~
ln -sfv "${DOTFILES_DIR}/system/.function" ~
ln -sfv "${DOTFILES_DIR}/system/.path" ~
ln -sfv "${DOTFILES_DIR}/system/.prompt" ~
ln -sfv "${DOTFILES_DIR}/system/.robomongorc.js" ~
ln -sfv "${DOTFILES_DIR}/system/.tmux.conf" ~

ln -sfv "${DOTFILES_DIR}/vim/.vimrc" ~
ln -sFnv "${DOTFILES_DIR}/vim" ~/.vim
ln -sFnv "${DOTFILES_DIR}/macos" ~/.macos
