#
# ~/.bash_profile
#

# Copy the .cache and .config directories to ram and point to the new path.
#export XDG_CACHE_HOME_ORIG=$XDG_CACHE_HOME
#export XDG_CACHE_HOME=/dev/shm/.cache
#rsync -a $XDG_CACHE_HOME_ORIG $XDG_CACHE_HOME


# Load .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

#setxkbmap dvorak
eval $(ssh-agent)
#ssh-add

# Improve rendering on firefox
export MOZ_DISABLE_PANGO=1
