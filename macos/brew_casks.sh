cask_apps=(
  alfred
  caffeine
  datagrip
  docker
  firefox
  google-chrome
  iterm2
  ngrok
  phpstorm
  postman
  pycharm
  slack
  sublime-text
  visual-studio-code
  vlc
  zoom
)
brew install --cask "${cask_apps[@]}"

# Quick look apps
brew install --cask ipynb-quicklook qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv suspicious-package
