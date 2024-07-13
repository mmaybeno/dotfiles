cask_apps=(
  alfred
  domzilla-caffeine
  docker
  firefox
  google-chrome
  iterm2
  postman
  pycharm
  slack
  sublime-text
  visual-studio-code
  vlc
  zoom
)
brew install --cask "${cask_apps[@]}"

quick_looks=(
  ipynb-quicklook
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  quicklook-csv
)

# Quick look apps
brew install --cask "${quick_looks[@]}"
