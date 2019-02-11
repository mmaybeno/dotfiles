# Simple setup script to install Vundle and all of the desired vim packages.
# Compiles the YCM bundle that is needed in order for it to run.
# Make sure you have cmake and python installed.
# If using OS X install cmake via homebrew

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +VundleUpdate +qall
python ~/.vim/bundle/YouCompleteMe/install.py
