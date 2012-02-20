# Make built-in commands a little more user friendly {
  alias c='cd'
  alias ct='cleartool'
  alias df='df -h'
  alias du='du -csh'
  alias grep='grep -n --color=auto'
  alias egrep='egrep -n --color=auto'
  alias fgrep='fgrep -n --color=auto'
  alias ls='ls -hF --color=always'
  alias l='ls'
  alias lr='ls -R'                    # recursive ls
  alias ll='ls -l'
  alias la='ll -A'
  alias lx='ll -BX'                   # sort by extension
  alias lz='ll -rS'                   # sort by size
  alias lt='ll -rt'                   # sort by date
  alias lm='la | more'
  alias mkdir='mkdir -p -v'
  alias more='less'
  alias ping='ping -c 3'

  alias gcc='gcc -std=gnu99'
# }

# Make some new useful commands {
  alias da='date "+%A, %B %d, %Y %T"'
  alias du1='du --max-depth=1'
  alias hist='history | grep $1'      # requires an argument
  alias openports='netstat --all --numeric --programs --inet'
  alias pg='ps -Af | grep $1'         # requires an argument
# }

# Privileged Access {
if [ $UID -ne 0 ]; then
    alias modprobe='sudo modprobe'
    alias mount='sudo mount'
    alias netcfg='sudo netcfg2'
    alias pt='sudo powertop'
    alias gparted='sudo gparted'
    alias root='sudo su'
    alias scat='sudo cat'
    alias sgvim='sudo vim'
    alias shalt='sudo halt'
    alias smv='sudo mv'
    alias sreboot='sudo reboot'
    alias svim='sudo vim'
    alias umount='sudo umount'
    alias wireshark='sudo wireshark'
else
    alias sudo=''
fi
# }

# Safety Features {
  alias cp='cp -i'
  alias mv='mv -i'
  alias rm='rm -i'
  alias ln='ln -i'
  alias chown='chown --preserve-root'
  alias chmod='chmod --preserve-root'
  alias chgrp='chgrp --preserve-root'
# }

# Directory changing aliases {
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias .....='cd ../../../..'
  alias cdd='cd ~/Dropbox'
  alias cds='cd ~/Dropbox/school'
# }

# Program Specific aliases {
  alias am='alsamixer'
  alias chromium='chromium-browser --disk-cache-size=268435456 &'
  alias chromium-browser='chromium'
  alias d='dropbox'
  alias dfs='dropbox filestatus'
  alias f='firefox-beta-bin'
  alias fah='/opt/fah-smp/fah6 &'
  alias fah_gpu='sudo /etc/rc.d/foldingathome-gpu start'
  alias fahstart='sudo /etc/rc.d/foldingathome-smp start'
  alias fahstop='sudo /etc/rc.d/foldingathome-smp stop'
  alias firefox='firefox-beta-bin'
  alias g='git'
  alias gv='gvim'
  alias mpdstart='(mpd ~/.mpd/mpd.conf && mpdscribble &)'
  alias mt='mpc toggle'
  alias pacman='sudo pacman-color'
  alias pm='pacman'
  alias um='udiskie-umount -a'
  alias pu='pacman -Syu'
  alias s='sudo pm-suspend'
  alias v='vim'
  alias wget='wget --trust-server-names'
  alias y='yaourt'
  alias yu='yaourt -Syuab --noconfirm'
# }

# Typos be gone! {
  alias vm='mv'
# }

# SSH and SFTP Shortcuts {
  alias sftpdreamhost='sftp kharoutinian@provenzano.dreamhost.com'
  alias sftpmongo='sftp -P 1984 krikor@spiderman.homeftp.net'
  alias sftpmongol='sftp -P 1984 krikor@mongo'
  alias sftpwrt='sftp -P 1984 root@192.168.1.1'
  alias sshdreamhost='ssh kharoutinian@provenzano.dreamhost.com'
  alias sshmongol='ssh -X -p 1984 krikor@mongo'
  alias sshwrt='ssh -p 1984 root@192.168.1.1'
  alias sml='sshmongol'
  alias sm='sshmongo'

  alias sftp47='sftp phatarmo@pc47.cs.ucdavis.edu'
  alias ssh18='ssh -X phatarmo@pc18.cs.ucdavis.edu'
  alias ssh22='ssh -X phatarmo@pc22.cs.ucdavis.edu'
  alias ssh46='ssh -X phatarmo@pc46.cs.ucdavis.edu'
  alias ssh47='ssh -X phatarmo@pc47.cs.ucdavis.edu'
  alias ssh48='ssh -X phatarmo@pc48.cs.ucdavis.edu'
  alias sshtetra='ssh -X phatarmo@tetra.cs.ucdavis.edu'
# }

# Configuration files {
  alias ba='gvim ~/.bash_aliases'
  alias bfun='gvim ~/.bash_functions'
  alias brc='gvim ~/.bashrc'
  alias prc='gvim ~/.pentadactylrc'
  alias vrc='gvim ~/.vimrc'

  alias fstab='sudo vim /etc/fstab'
  alias arc='gvim ~/.config/awesome/rc.lua'
# }

# Distro Specific aliases {
  kernel=$(uname -r)
  if echo $kernel | grep -q "ARCH"
  then
    # Arch Linux specific
    alias diff='colordiff'        # Requires colordiff package
    alias update='sudo pacman -Syy'
    alias upgrade='sudo pacman -Su'
    alias wicd='wicd-curses'
    export PACMAN=pacman-color
  else
    # Debian specific
    alias apt-get='sudo apt-get'
    alias apt-cache='sudo apt-cache'
    alias inst='apt-get install'
    alias update='apt-get update'
    alias upgrade='apt-get upgrade'
    alias u='apt-get update && sudo apt-get upgrade'
  fi
# }

