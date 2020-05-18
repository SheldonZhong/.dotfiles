#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -alFh'
alias lt='ls --color=auto -ltrh'
alias ldot='ls --color=auto -lhd .?*'

alias free='free -h'
alias df='df -h'
alias du='du -sh'

alias watch='watch '

alias sudo='sudo '
alias hibernate='systemctl hibernate'

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias onedrive='docker logs onedrive | tail -n 20'

# tools
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'

export EDITOR=vim

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

__BLUE__=$(tput setaf 6)
__BOLD__=$(tput bold)
__GREEN__=$(tput setaf 2)
__COLOR__OFF__=$(tput sgr0)
__YELLOW__=$(tput setaf 3)
__RED__=$(tput setaf 1)

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

function custom_prompt() {
  __git_ps1 "${__BLUE__}[\\d \\t] ${__BOLD__}${__GREEN__}\\u@\\h${__COLOR__OFF__}${__BOLD__}:${__YELLOW__}\\w${__COLOR__OFF__}" "${__RED__}${__BOLD__}\`__nonzero_return\`${__COLOR__OFF__}\n\\$ "

  type __vte_osc7 >/dev/null 2>&1 && VTE_PWD_THING="$(__vte_osc7)"
  PS1="$PS1$VTE_PWD_THING"
}

PROMPT_COMMAND=custom_prompt
