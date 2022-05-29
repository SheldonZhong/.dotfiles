# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/sheldon/.zshrc'
zstyle ':completion:*' list-colors

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.alias

source ~/.prompt

precmd () {
  __git_ps1 "${__BLUE__}[%D{%a %b %d} %*] ${__BOLD__}${__GREEN__}%n@%M${__COLOR__OFF__}${__BOLD__}:${__YELLOW__}%~${__COLOR__OFF__}" "${__RED__}${__BOLD__}`__nonzero_return`${__COLOR__OFF__}"$'\n'"$ "
}

