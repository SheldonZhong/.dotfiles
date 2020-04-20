#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias ll='ls --color=auto -l'
alias lt='ls --color=auto -ltr'
alias ldot='ls --color=auto -ld .?*'

alias free='free -h'
alias df='df -h'
alias du='du -h'

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# tools
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'

# bash only: disable bash's Ctrl+S in vim
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    # osx users, use stty -g
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}

# PS1='[\u@\h \W]\$ '
export HISTCONTROL=ignoreboth:erasedups

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM=verbose
export GIT_PS1_DESCRIBE_STYLE=contains
export GIT_PS1_SHOWCOLORHINTS=1
source ~/.git-prompt.sh
# export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

function __nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[$RETVAL]"
}

export PROMPT_COMMAND='__git_ps1 "$(tput setaf 6)[\\d \\t] $(tput bold)$(tput setaf 2)\\u@\\h$(tput setaf 7):$(tput setaf 3)\\w$(tput sgr0)" "$(tput setaf 1)\`__nonzero_return\`$(tput setaf 7)\n\\$ "'

