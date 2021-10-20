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
# THEMES / PLUGINS / CONFIGS
#==========================================================

# themes
ZSH_THEME="bira"

# plugins
plugins=(
    git
    pip
    python
    vscode
    web-search
    extract
    sudo
    dircycle 
    common-aliases
    command-not-found
    zsh-syntax-highlighting
    zsh-autosuggestions
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
setopt appendhistory
setopt histignorealldups
setopt nobeep
setopt autocd

# variables
export LANG=en_US.UTF-8
export BROWSER=/usr/bin/google-chrome-stable
export TERMINAL=/usr/bin/tilix
export EDITOR=/usr/bin/nvim

# paths
export PATH="/home/$USER/.bin/:$PATH"
export ZSH="/home/$USER/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

#==========================================================
# OTHER CONFIGS
#==========================================================

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

# disable BIOS beep
xset -b

#==========================================================
# FUNCTIONS
#==========================================================

# file search
fs() { rifle "$(find -type f | fzf -e --reverse --prompt="Enter string > " --header="ESC to quit. ")" }

# remove orphan packages
ro() { sudo pacman -Rns $(pacman -Qtdq) }

# remove all docker containers
drma() { docker rm $(docker ps -aq ) }

#==========================================================
# ALIASES / SHORTCUTS
#==========================================================

# shortcuts
alias e="cd ~/elte/"
alias g="cd ~/github/"
alias p="cd ~/github/playground/"

# config files
alias bashc="$EDITOR ~/.bashrc"
alias zshc="$EDITOR ~/.zshrc"
alias vimc="$EDITOR ~/.config/nvim/init.vim"
alias i3c="$EDITOR ~/.i3"

# terminal
alias cl="clear"
alias vim="nvim"
alias cat="bat"
alias more="less"
alias cin="xclip -selection clipboard"
alias df="df -h"
alias free="free -m"
alias orphans="pacman -Qtdq"

# git
alias gI='git init'
alias gA="git add ."
alias gP="git push origin master"
alias gL="git pull origin master"
alias gC="gcmsg"
alias gS="git status"
alias glog="git log --oneline --all --graph --decorate"
alias gitu="git add . && git commit && git push"

# docker
alias diL="docker images"
alias dvL="docker volume ls"
alias dR="docker run --rm"
alias dS="docker stop"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drm="docker rm"
alias drmi="docker rmi"

# dns
alias dns='cat /etc/resolv.conf'
alias dns-adguard1='sudo sh -c "echo nameserver 176.103.130.130 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nADGUARD DEFAULT (adblock)\n176.103.130.130"'
alias dns-adguard2='sudo sh -c "echo nameserver 176.103.130.132 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nADFUARD FAMILY (adblock + porn)\n176.103.130.132"'
alias dns-cloudflare='sudo sh -c "echo nameserver 1.1.1.1 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nCLOUDFLARE (FAST)\n1.1.1.1"'
alias dns-google='sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nGOOGLE (STABLE)\n8.8.8.8"'
alias dns-yandex='sudo sh -c "echo nameserver 77.88.8.8 > /etc/resolv.conf"; echo -e "DNS changed successfully!\n\nYANDEX (FAST + STABLE)\n77.88.8.8"'
