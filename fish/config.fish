# wallchange
set WC_USERNAME "paraselene92"
set WC_PIC_DIR "/mnt/d/two_dimention"
set WTJSON_DIR "/mnt/c/Users/$WC_USERNAME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/"

# starship init
starship init fish | source

# env
set envpath $HOME/.local/bin /usr/local/go/bin $HOME/.tfenv/bin $HOME/.fzf/bin

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

