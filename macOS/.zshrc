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
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zinit" && command chmod g-rwx "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin"
fi

## zinit invoke
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## zsh plugins
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept

## active HOME/End key
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
if command -v starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

## keychain
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
alias gl='gcloud'

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# .zshディレクトリから関数と変数をロードする設定を.zshrcに追加
for file in "~/.zsh/**/*.zsh"; do
    source "$file"
done

