###########################################################
#
#
#                ███████╗ ██████╗██╗  ██╗
#                ╚════██║██╔════╝██║  ██║
#                  ███╔═╝╚█████╗ ███████║
#                ██╔══╝   ╚═══██╗██╔══██║
#                ███████╗██████╔╝██║  ██║
#                ╚══════╝╚═════╝ ╚═╝  ╚═╝
# 
#   config by @utupointko - © 2020 Arslan Abdizhalilov
#
###########################################################





#==========================================================
# CONFIGS / THEMES / PLUGINS
#==========================================================

# paths
export ZSH="/home/$USER/.oh-my-zsh"
export PATH="/home/$USER/.bin/:$PATH"
export BROWSER=/usr/bin/google-chrome-stable
export TERMINAL=/usr/bin/tilix
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# themes
ZSH_THEME="bira"

ZSH_THEME_RANDOM_CANDIDATES=( 
    "robbyrussell" 
    "agnoster"
    "amuse"
    "avit"
    "powerlevel9k/powerlevel9k"
    "spaceship"
    "bira"
)

# configs
HISTSIZE=10000
SAVEHIST=10000
ENABLE_CORRECTION="false"
HIST_STAMPS="dd/mm/yyyy"

# options
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt nobeep
setopt appendhistory
setopt histignorealldups
setopt autocd

# plugins
plugins=(
    git
    #pip
    #python
    #vscode
    dircycle 
    zsh-syntax-highlighting
    zsh-autosuggestions
    #jsontools
    #history
    #common-aliases
    command-not-found
    #copyfile
    #extract
    sudo
    web-search
)

source $ZSH/oh-my-zsh.sh

#==========================================================
# OTHER CONFIGSS
#==========================================================


# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# error handling
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# promt without user name
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.$USER)"
  fi
}

# basic auto tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

export LANG=en_US.UTF-8
#(cat $HOME/.config/wpg/sequences &) && clear

#xset +fp /home/arslan/.local/share/fonts
#xset fp rehash

# disable BIOS beep
xset -b

# file search
fs() { rifle "$(find -type f | fzf -e --reverse --prompt="Enter string > " --header="ESC to quit. ")" }

# switch playback audio
pa-list() { pacmd list-sinks | awk '/index/ || /name:/' ;}
pa-set() { 
	# list all apps in playback tab (ex: cmus, mplayer, vlc)
	inputs=($(pacmd list-sink-inputs | awk '/index/ {print $2}')) 
	# set the default output device
	pacmd set-default-sink $1 &> /dev/null
	# apply the changes to all running apps to use the new output device
	for i in ${inputs[*]}; do pacmd move-sink-input $i $1 &> /dev/null; done
}
pa-playbacklist() { 
	# list individual apps
	echo "==============="
	echo "Running Apps"
	pacmd list-sink-inputs | awk '/index/ || /application.name /'

	# list all sound device
	echo "==============="
	echo "Sound Devices"
	pacmd list-sinks | awk '/index/ || /name:/'
}
pa-playbackset() { 
	# set the default output device
	pacmd set-default-sink "$2" &> /dev/null
	# apply changes to one running app to use the new output device
	pacmd move-sink-input "$1" "$2" &> /dev/null
}

#==========================================================
# ALIASES / SHORTCUTS
#==========================================================

# shortcuts
alias e="cd ~/elte/"
alias g="cd ~/github/"
alias p="cd ~/github/playground/"

# terminal
alias cl="clear"
alias py="python3"
alias cp="cp -iv"
alias df="df -h"
alias free="free -m"
alias more="less"
alias grep="grep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias c="xclip -selection clipboard"
alias orphans="pacman -Qtdq"
alias ro="sudo pacman -Rns $(pacman -Qtdq)"
alias clean="rm -rf .cache/yay/* ; rm -rf .local/share/Trash/files/*"

# config files
alias bashc="vim ~/.bashrc"
alias zshc="vim ~/.zshrc"
alias vimc="vim ~/.vimrc"
alias i3c="vim ~/.i3/"
alias polybarc="vim ~/.config/polybar/"
alias comptonc="vim ~/.config/compton.conf"

# git
alias rs="rails s"
alias ys="yarn start"
alias gI='git init'
alias gA="git add ."
alias gP="git push origin master"
alias gL="git pull origin master"
alias gC="gcmsg"
alias gS="git status"
alias glog="git log --oneline --all --graph --decorate"
alias gitu="git add . && git commit && git push"

# wifi
alias winfo="iw dev"
alias wstatus="iw wlp3s0 link; nmcli d"
alias wscan="sudo iwlist wlp3s0 scan"
alias wlist="nmcli dev wifi list"
alias wconnect="nmcli -ask  dev wifi connect"
alias wconnect802="sudo nmcli c --ask up"
alias wdisconnect="nmcli con down id"
alias wdisconnect802="sudo nmcli c --ask down"

alias dns='cat /etc/resolv.conf'
alias dns-adguard1='sudo sh -c "echo nameserver 176.103.130.130 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nADGUARD DEFAULT (adblock)\n176.103.130.130"'
alias dns-adguard2='sudo sh -c "echo nameserver 176.103.130.132 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nADFUARD FAMILY (adblock + porn)\n176.103.130.132"'
alias dns-cloudflare='sudo sh -c "echo nameserver 1.1.1.1 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nCLOUDFLARE (FAST)\n1.1.1.1"'
alias dns-google='sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nGOOGLE (STABLE)\n8.8.8.8"'
alias dns-yandex='sudo sh -c "echo nameserver 77.88.8.8 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nYANDEX (FAST + STABLE)\n77.88.8.8"'

# devices
alias mypref="inxi -Fxz"
alias mydev="lsusb; ifconfig"
alias mypip="curl ifconfig.me"
alias mylip="hostname -I"
alias mymc="ifconfig -a | grep ether"

# temp apps
alias temp="sh ~/.bin/temp.sh"
alias btooth="sh ~/.bin/btooth.sh"
alias lyrics="py ~/.bin/lyrics.py"
alias drive="py ~/.bin/drive.py"  
alias aramis="ssh -L 2001:aramis.inf.elte.hu:1521 utupointko@caesar.elte.hu"
alias sage-start="docker run -p8888:8888 sagemath/sagemath:latest sage-jupyter"
alias siji="xfd -rows '19' -columns '34' -fn '-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1'"
alias say='echo "$1" | espeak -s 120 2>/dev/null'
alias weather='curl wttr.in'
#alias bmenu="bmenu"
#alias ranger="ranger"
#alias bashtop="bashtop"
#alias ncdu="ncdu"
#alias spt="spt"
#alias cordless="cordless"

