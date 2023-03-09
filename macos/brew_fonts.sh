brew tap homebrew/cask-fonts

cask_apps=(
  font-hack
  font-roboto
  font-source-code-pro
)
brew install --cask "${cask_apps[@]}"