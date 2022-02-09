# BASH Resource File #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# env & aliases
[ -f "$HOME/.config/shell/profile" ] && source "$HOME/.config/shell/profile"
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# prompt
PS1='\033[1;35m\h \033[00mat \033[1;34m\W \033[1;32m> \033[00m'

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.
