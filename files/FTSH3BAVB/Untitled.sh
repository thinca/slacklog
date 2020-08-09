mkdir -p /tmp/.bundle/bin
echo 'echo VimVim' > /tmp/.bundle/bin/manbou.sh
chmod +x /tmp/.bundle/bin/manbou.sh
export PATH=.bundle/bin:$PATH

# pwd: $HOME
manbou.sh
# zsh: command not found: manbou.sh

# pwd: /tmp
manbou.sh
# VimVim
