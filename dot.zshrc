# t_ymt2
#.zshrc

# LANG
#
export LANG=ja_JP.UTF-8

# set prompt
#
autoload colors
colors
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr
zstyle ':vcs_info:git:*' unstagedstr
zstyle ':vcs_info:*' formats '[%s-%b] %c%u'
zstyle ':vcs_info:*' actionformats '[%s-%b|%a] %c%u'
precmd () {
	psvar=()
	LANG=ja_JP.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%U$USER@%m%%%u [%(5~,%-2~/.../%2~,%~)]
$ "
# RPROMPT="[%~]"
RPROMPT="%1(v|%F{WHITE}%1v%f|)"
SPROMPT="%r is correct? [n,y,a,e]: "

# auto change directory, directory pushed
#
setopt auto_cd
setopt auto_pushd
setopt pushd_minus

# command correct
#
setopt correct
setopt CORRECT_ALL

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep
#
setopt nolistbeep

# keybind configuration
#
bindkey -e

# zsh editor
#
autoload zed

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=999999
SAVEHIST=999999
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
if [ $UID = 0 ]; then
	unset HISTFILE
	SAVEHIST=0
fi

# completion configuration
#
autoload -U compinit
compinit
#autoload predict-on
#predict-on
setopt prompt_subst
setopt auto_remove_slash
setopt always_last_prompt
setopt extended_glob

# functions
# 
function euc() {
for i in $@; do;
	nkf -e -Lu $i >! /tmp/euc.$$
	mv -f /tmp/euc.$$ $i
done;
}

function sjis() {
for i in $@; do;
	nkf -s -Lw $i >! /tmp/sjis.$$
	mv -f /tmp/sjis.$$ $i
done;
}

function utf8() {
for i in $@; do;
    nkf -w -Lu $i >! /tmp/utf8.$$
    mv -f /tmp/utf8.$$ $i
done;
}

# ls configuration
#
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls='ls -G'
alias la='ls -a'
alias lf='ls -F'
alias ll='ls -l'
alias du='du -h'
alias df='df -h'
alias su='su -l'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# alias configuration
# 
setopt complete_aliases

alias where='command -v'
alias -g M="| less"
alias -g G='| grep'
alias -g C='| cat -n'
alias -g W='| wc'
alias -g H='| head'
alias -g T='| tail'
alias -g ....='../..'

function app_alias()
{
	local APP=$1
	shift
	for i in $@; do; alias -s $i=${APP}; done;
}
app_alias zipinfo zip
app_alias gzcat tgz gz tbz bz2
app_alias display gif jpg jpeg png bmp
app_alias emacs txt tex c h cpp py hs php

## load user .zshrc configuration file
#
# [ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
