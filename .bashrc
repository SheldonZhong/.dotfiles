#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o noclobber

source ~/.alias

export EDITOR=vim

# bash only: disable bash's Ctrl+S in vim
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    # osx users, use stty -g
    if [[ $OSTYPE == "darwin"* ]]; then
      local STTYOPTS="$(stty -g)"
    else
      local STTYOPTS="$(stty --save)"
    fi
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}

export HISTCONTROL=ignoreboth:erasedups

source ~/.prompt

function custom_prompt() {
  __git_ps1 "${__BLUE__}[\\d \\t] ${__BOLD__}${__GREEN__}\\u@\\h${__COLOR__OFF__}${__BOLD__}:${__YELLOW__}\\w${__COLOR__OFF__}" "${__RED__}${__BOLD__}\`__nonzero_return\`${__COLOR__OFF__}\n\\$ "

  type __vte_osc7 >/dev/null 2>&1 && VTE_PWD_THING="$(__vte_osc7)"
  PS1="$PS1$VTE_PWD_THING"
}

# PS1='[\u@\h \W]\$ '
# export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
PROMPT_COMMAND=custom_prompt

if [ -f /usr/share/fzf/completion.bash ]; then
    source /usr/share/fzf/completion.bash
fi

if [ -f /usr/share/fzf/key-bindings.bash ]; then
    source /usr/share/fzf/key-bindings.bash
fi

source ~/.exports
