# Install command-line tools and apps using Homebrew.

if test ! $(which brew); then
	echo "Installing Brew"
	/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Brew already installed"
fi;

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install other useful binaries and fonts.
apps=(
  brew-cask-completion
  cmake
  ctop
  curl
  docker-completion
  git
  git-lfs
  go
  highlight
  htop
  httpie
  icdiff
  imagemagick
  jq
  nmap
  nvm
  openssh
  openssl
  p7zip
  pigz
  pip-completion
  pipenv
  pv
  pyenv
  rename
  ruby
  screen
  ssh-copy-id
  testssl
  tree
  vim
  wget
  zlib
  zopfli
)
brew install "${apps[@]}"

# Remove outdated versions from the cellar.
brew cleanup
