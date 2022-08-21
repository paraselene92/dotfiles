## Setting GOENV path
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

## Setting GOPATH 
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

## [[ -f ~/.zshrc ]] && . ~/.zshrc

