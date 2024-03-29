if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
	eval "$(/usr/local/bin/brew shellenv)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
