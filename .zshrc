# ZSH Resource File #

# Comp
autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# terminal title
case "$TERM" in (alacritty|rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    local term_title () { print -n "\e]0;${(j: :q)@}\a"}
    precmd () {
      local DIR="$(print -P '%d')"
      term_title "$DIR"
    }
    preexec () {
      local DIR="$(print -P '%c')"
      local CMD="${(j:\n:)${(f)1}}"
      term_title "$DIR: $CMD"
    }
  ;;
esac

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
HISTCONTROL=erasedups:ignoredups:ignorespace

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
# [ -s "$HOME/.local/src/zsh-git-prompt" ] && source "$HOME/.local/src/zsh-git-prompt"
source /usr/lib/zsh-git-prompt/zshrc.sh
# GIT_PROMPT_EXECUTABLE="haskell" # defauly is python, set to haskell when installing manually

# Set the default editor
export EDITOR=vim
export VISUAL=vim

# FUNCTIONS

#confirm
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


# edit a file
edit () {
	if [ "$(type nvim)" = "file" ]; then
		nvim "$@"
	elif [ "$(type vim)" = "file" ]; then
		vim "$@"
	else
		vi "$@"
	fi
}

# sudo edit a file
sedit () {
	if [ "$(type nvim)" == "file" ]; then
		sudo nvim "$@"
	elif [ "$(type vim)" == "file" ]; then
		sh -c sudo vim "$@"
	else
		sh -c sudo vi "$@"
	fi
}

# extract any archive
extract () {
	for archive in "$@"; do
		if [ -f "$archive" ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf "$archive"    ;;
				*.tar.gz)    tar xvzf "$archive"    ;;
				*.bz2)       bunzip2 "$archive"     ;;
				*.rar)       rar x "$archive"       ;;
				*.gz)        gunzip "$archive"      ;;
				*.tar)       tar xvf "$archive"     ;;
				*.tbz2)      tar xvjf "$archive"    ;;
				*.tgz)       tar xvzf "$archive"    ;;
				*.zip)       unzip "$archive"       ;;
				*.Z)         uncompress "$archive"  ;;
				*.7z)        7z x "$archive"        ;;
				*.deb)       ar x $1				;;
      			*.tar.xz)    tar xf $1    			;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# copy and go to the directory
cpg () {
	if [ -d "$2" ];then
		cp "$1" "$2" && cd "$2" || return
	else
		cp "$1" "$2"
	fi
}

# move and go to the directory
mvg () {
	if [ -d "$2" ];then
		mv "$1" "$2" && cd "$2" || return
	else
		mv "$1" "$2"
	fi
}

# create and go to the directory
mkdirg () {
	mkdir -p "$1"
	cd "$1" || return
}

# goes up a specified number ofdirectories  (i.e. up 4)
up () {
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd "$d" || return
}

# do an ls after each cd
cdl () {
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# returns the last 2 fields of the working directory
pwdtail () {
	pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}


# show current network information
netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	echo ""
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	echo ""
	/sbin/ifconfig | awk /'inet addr/ {print $4}'

	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------------------"
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Internal IP Lookup
	default_if=$(route | grep "default" | awk '{print $NF}')
	echo -n "Internal IP: " ; /sbin/ifconfig "$default_if" | grep "inet" | head -1 | awk '{print $2}'

	# External IP Lookup
	echo -n "External IP: " ; dig +short myip.opendns.com @resolver1.opendns.com
}

# trim leading and trailing spaces (for scripts)
trim()
{
	local var="$*"
	var="${var#"${var%%[![:space:]]*}"}"  # remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}"  # remove trailing whitespace characters
	echo -n "$var"
}

#########
# Docker
#########

# display docker containers names
alias dnames=dnames-fn
function dnames-fn {
for ID in $(docker ps | awk '{print $1}' | grep -v 'CONTAINER')
	do
    	docker inspect "$ID" | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

# display docker containers IP addresses
alias dip=dip-fn
function dip-fn {
    echo "IP addresses of all named running containers"

	for DOC in $(dnames-fn)
    do
		IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC")
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e "$OUT" | column -t
    unset OUT
}

# docker exec -it
alias dex=dex-fn
function dex-fn {
	docker exec -it "$1" "${2:-sh}"
}

# docker inspect
alias di=di-fn
function di-fn {
	docker inspect "$1"
}

# docker logs --follow
alias dl=dl-fn
function dl-fn {
	docker logs -f "$1"
}

# docker run -it
alias drun=drun-fn
function drun-fn {
	docker run -it "$1" "$2"
}

# docker compose run
alias dcr=dcr-fn
function dcr-fn {
	docker compose run "$@"
}

# docker stop && docker rm
alias dsr=dsr-fn
function dsr-fn {
	docker stop "$1";docker rm "$1"
}

# docker rm exited containers
alias drmx=drmc-fn
function drmc-fn {
       docker rm "$(docker ps --all -q -f status=exited)"
}

# docker remove dangling images
alias drmid=drmid-fn
function drmid-fn {
       imgs=$(docker images -q -f dangling=true)
       [ -n "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}

# show containers IDs filtered by label
function dlab {
       docker ps --filter="label=$1" --format="{{.ID}}"
}

# docker compose
alias dc=dc-fn
function dc-fn {
        docker compose "$*"
}

#############
# PostgreSQL
#############
function pgls {
        if [ "$(type pg_lsclusters)" != "file" ]; then
                return
        fi
        IFS=$'\n'
		for CL in $(pg_lsclusters -h); do
                version=$(echo "$CL" | awk '{print $1}')
                port=$(echo "$CL" | awk '{print $3}')
				echo "PostgreSQL version $version - port $port"
                if ! psql -p "$port" -d template1 -c "\q" 2>/dev/null; then
                        echo -e " $USER cannot connect to psql version $version without a password"
                        echo -e " consider using a user with psql peer authentication enabled"
                        break
                fi
                psql -p "$port" -d template1 -c "select datname from pg_database" | tail -n +6 | head -n-2
        done
		unset IFS
}

########
# node #
########

function nvm {
	[ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
	nvm "$@"
}

function pyenvload {
	export PYENV_ROOT="$HOME/.pyenv"
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
}
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/home/ae/.bun/_bun" ] && source "/home/ae/.bun/_bun"
