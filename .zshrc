# ZSH Resource File #

# Comp
autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Options
setopt GLOB_DOTS

# Prompt theme
PS1='%B%F{13}%m%f%b at %B%F{12}%~%f %F{10}>%f%b $(git_super_status) '

# Variables & aliases
typeset -U PATH path
[ -f "$HOME/.config/shell/profile" ] && source "$HOME/.config/shell/profile"
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignoreboth:erasedups

# Keybindings
bindkey -v
typeset -g -A key
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# PLUGINS #
# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-git-prompt
source /usr/lib/zsh-git-prompt/zshrc.sh
# GIT_PROMPT_EXECUTABLE="haskell" # defauly is python, set to haskell when installing manually

# FUNCTIONS
# confirm
confirm() {
    local answer
    echo -ne "zsh: sure you want to run '${YELLOW}$*${NC}' [yN]? "
    read -q answer
        echo
    if [[ "${answer}" =~ ^[Yy]$ ]]; then
        command "${@}"
    else
        return 1
    fi
}

confirm_wrapper() {
    if [ "$1" = '--root' ]; then
        local as_root='true'
        shift
    fi

    local prefix=''

    if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi
    confirm ${prefix} "$@"
}

poweroff() { confirm_wrapper $0 "$@"; }
reboot() { confirm_wrapper $0 "$@"; }
hibernate() { confirm_wrapper $0 "$@"; }

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
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

case "$TERM" in (alacritty|rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '%c')"
      term_title "alacritty"
    }
    preexec () {
      local DIR="$(print -P '%c')"
      local CMD="${(j:\n:)${(f)1}}"
      term_title "$DIR" "$CMD"
      term_title "$CMD"
    }
  ;;
esac
