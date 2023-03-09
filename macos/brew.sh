# Install command-line tools and apps using Homebrew.

if test ! $(which brew); then
	echo "Installing Brew"
	/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Brew already installed"
fi;

# # Make sure we’re using the latest Homebrew.
brew update

# # Upgrade any already-installed formulae.
brew upgrade

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

# # Remove outdated versions from the cellar.
brew cleanup
