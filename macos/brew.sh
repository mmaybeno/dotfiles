#!/usr/bin/env bash
# Install command-line tools and apps using Homebrew.

# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

# Ask for the administrator password upfront.
sudo -v

if test ! $(which brew); then
	echo "Installing Brew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
else
	echo "Brew already installed"
fi;

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install other useful binaries and fonts.
brew tap caskroom/fonts
apps=(
  ack
  bash
  bash-completion@2
  brew-cask-completion
  cmake
  coreutils
  ctags
  curl
  docker-completion
  docker-compose-completion
  findutils
  git
  git-lfs
  gnu-sed
  go
  grep
  highlight
  htop
  httpie
  icdiff
  imagemagick
  jq
  libev
  libidn
  moreutils
  nmap
  node
  nvm
  openssh
  openssl
  p7zip
  pigz
  pip-completion
  pipenv
  proj
  pv
  pyenv
  python
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

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install cask applications
cask_apps=(
  alfred
  datagrip
  docker
  dropbox
  evernote
  flux
  font-roboto
  font-source-code-pro
  google-chrome
  intellij-idea
  iterm2
  java
  pycharm
  slack
  skype
  sublime-text
  transmission
  tunnelblick
  visual-studio-code
  vlc
  xquartz
)
brew cask install "${cask_apps[@]}"

# Quick look apps
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup

# Reinstall all outdated casks
# brew cask outdated | awk '{print $1}' | xargs brew cask reinstall
