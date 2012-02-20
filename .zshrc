HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt appendhistory autocd extendedglob
unsetopt beep nomatch
bindkey -e

zstyle :compinstall filename '/home/krikor/.zshrc'

autoload -Uz colors compinit promptinit
colors
compinit
promptinit

#Set prompt theme
prompt adam2

#import aliases
if [[ -a .aliases ]]
then
    source .aliases
fi


# Key Bindings {
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# History serch
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# }
