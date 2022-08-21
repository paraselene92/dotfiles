# color
set fish_color_command white --bold
set fish_color_redirection brblue --bold
set fish_color_quote yellow --bold 
set fish_color_param cyan --bold

# starship init
starship init fish | source

# env
set envpath $HOME/.local/bin /usr/local/go/bin $HOME/.tfenv/bin $HOME/.fzf/bin $HOME/.npm-global/bin

for i in $envpath;
  if test -d $i
    set PATH $PATH $i
  else
    echo $i no exist.
  end
end

# invoke fish-ssh-agent
fish_ssh_agent

# ssh-add
set keys ~/.ssh/keys/id_rsa ~/.ssh/keys/github
if test -f (which keychain)
  for i in $keys;
    eval (keychain --eval --quiet --agents ssh $i)
  end
end

# ssh-add (pemonly)
ssh-add ~/.ssh/keys/site-lightsail01.pem

# goenv settings
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin $PATH
eval (goenv init - | source)
set -x PATH $GOROOT/bin $PATH
set -x PATH $PATH $GOPATH/bin

