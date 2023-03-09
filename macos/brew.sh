#!/usr/bin/env bash
# Install command-line tools and apps using Homebrew.

# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

# Ask for the administrator password upfront.
# sudo -v

# if test ! $(which brew); then
# 	echo "Installing Brew"
# 	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# else
# 	echo "Brew already installed"
# fi;

# # Keep-alive: update existing `sudo` time stamp until the script has finished.
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # Make sure we’re using the latest Homebrew.
# brew update

# # Upgrade any already-installed formulae.
# brew upgrade

# Install other useful binaries and fonts.
apps=(
  bash
  bash-completion@2
  brew-cask-completion
  cmake
  curl
  docker-completion
  docker-compose-completion
  findutils
  git
  git-lfs
  go
  grep
  highlight
  htop
  httpie
  icdiff
  imagemagick
  java
  jenv
  jq
  nmap
  node
  nvm
  openssh
  openssl
  p7zip
  pigz
  pip-completion
  pipenv
  pv
  pyenv
  python@3.10
  rename
  ruby
  screen
  ssh-copy-id
  testssl
  tree
  vim
  wget
  wrk
  zlib
  zopfli
)
brew install "${apps[@]}"

# # Switch to using brew-installed bash as default shell
# if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
#   echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
#   chsh -s /usr/local/bin/bash;
# fi;

# # Remove outdated versions from the cellar.
# brew cleanup
