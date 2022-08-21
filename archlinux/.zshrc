source ~/.zprofile

## shell history
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000

## PATH
export PATH="$PATH:$HOME/.npm-global/bin" ## npm
export PATH="$PATH:$HOME/.local/bin" ## pip

## reading function
## default_function = compinit, promptinit
autoload -U compinit promptinit

## Hokan
compinit

## Prompt
promptinit

## prompt theme-name
## prompt bart
autoload -U colors && colors
PROMPT="%B[%{$fg[cyan]%}%n%{$reset_color%}@%B%{$fg[cyan]%}%M:%~%{$reset_color%}]%b(%?)
%# "
RPROMPT="%D %*"

## zinit installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zinit" && command chmod g-rwx "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin"
fi

## zinit invoke
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## zsh plugins
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept

## active HOME/End key
#bindkey "^[[H" beginning-of-line
#bindkey "^[[F" end-of-line
bindkey "^[[1" beginning-of-line
bindkey "^[[4" end-of-line

zinit light zdharma/fast-syntax-highlighting

## 
setopt auto_list
setopt auto_menu
setopt auto_cd
setopt share_history

## 
zstyle ':completion:*:default' menu select=1

## starship
eval "$(starship init zsh)" 

## keychain
keys=(\
  "$HOME/.ssh/keys/site-lightsail01.pem"\
  "$HOME/.ssh/keys/github"\
  "$HOME/.ssh/keys/code_commit"\
)

for x in $keys;
do
  eval $(keychain --eval --agents ssh --quiet $x);
done

## fzf
[ -f ~/.zsh/.fzf.zsh ] && source ~/.zsh/.fzf.zsh

## environments
EDITOR=vi

## dircolors(ls colors)
## dircolors = https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
eval "$(dircolors -b)"
eval "$(dircolors -b ~/.dircolors)"
## dircolors(zsh completion)
autoload -Uz colors
colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"")}"

## alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -al'

## temporary
source ~/.xprofile

## func
s3mpv() {
  local bucketname filename fileurl
  bucketname='radiko-docker-bucket'
  filename=$(aws s3api list-objects --bucket $bucketname | jq -r -c '.Contents[] | select(.StorageClass == "STANDARD") | .Key' | fzf +m)
  fileurl=$(aws s3 presign s3://$bucketname/$filename)
  echo "Listening $filename ..."
  mpv --ontop=yes --border=yes $fileurl
}

