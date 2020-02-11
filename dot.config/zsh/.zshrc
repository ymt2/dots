# prompt
autoload -U colors
colors

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes false
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:*' formats '[%s-%b] %c%u'
zstyle ':vcs_info:*' actionformats '[%s-%b|%a] %c%u'
zstyle ':vcs_info:*' enable git hg

_precmd_vcs_info () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _precmd_vcs_info

if [[ -f "/usr/local/opt/kube-ps1/share/kube-ps1.sh" ]]; then
    KUBE_PS1_PREFIX='['
    KUBE_PS1_SUFFIX=']'
    source /usr/local/opt/kube-ps1/share/kube-ps1.sh
fi

gcp_info() {
    if [ -f "$HOME/.config/gcloud/active_config" ]; then
        gcp_profile=$(cat $HOME/.config/gcloud/active_config)
        gcp_project=$(awk '/project/{print $3}' $HOME/.config/gcloud/configurations/config_$gcp_profile)
        if [ ! -z ${gcp_project} ]; then
            echo "[${_prompt_my_colors[1]}ⓖ %f${gcp_project}]"
        fi
    fi
}

local pct=$'%0(?||%18(?||%{\e[31m%}))$%{\e[m%}'
PROMPT="%U$USER@%m%%%u [%(5~,%-2~/.../%2~,%~)] %1(v|%F{WHITE}%1v%f|)
$pct "

SPROMPT="%r is correct? [n,y,a,e]: "

RPROMPT='$(kube_ps1)'$RPROMPT
RPROMPT=$RPROMPT' $(gcp_info)'

setopt transient_rprompt

# cd
setopt auto_cd
setopt auto_pushd
setopt pushd_minus

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep
setopt nolistbeep

# keybind configuration
bindkey -e

# zsh editor
autoload zed

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# command history configuration
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

if [ $UID = 0 ]; then
    unset HISTFILE
    SAVEHIST=0
fi

# completion configuration
autoload -U compinit
compinit
setopt prompt_subst
setopt auto_remove_slash
setopt always_last_prompt
setopt extended_glob
setopt correct
setopt CORRECT_ALL
setopt complete_aliases
#autoload predict-on
#predict-on

zstyle ':completion:*' menu select interactive
# setopt menu_complete

# zmv
autoload -U zmv
alias zmv='noglob zmv -W'

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Complete g like git
compdef g=git

## global aliases
alias -g L='| less -N'
alias -g M='| less -N'
alias -g G='| grep -n'
# alias -g C='| cat -n'
alias -g C='| pbcopy'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g H='| head'
alias -g T='| tail'
alias -g X='| xargs -0'
alias -g Xg='| xargs -0 grep -n'
alias -g ....='../..'
alias -g E='2>&1 > /dev/null'

alias -g Gb='`git branch -vv | fzf +m | awk '\''{print $1}'\''`'

# aliases
alias du='du -h'
alias df='df -h'
alias su='su -l'
alias less='less -R'
alias where='command -v'
alias grep='grep --color=auto -n'
alias e='emacsclient -n -a ""'
alias t=tig

if type exa >/dev/null 2>&1; then
    alias ls='exa --group-directories-first --icons --classify'
fi
alias l='ls -lha'

app_alias() {
    local APP=$1
    shift
    for i in $@; do; alias -s $i=${APP}; done;
}

app_alias zipinfo zip
app_alias gzcat tgz gz tbz bz2
app_alias display gif jpg jpeg png bmp
app_alias emacs txt tex c h cpp

# Resume current directory
if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
    chpwd() {
        local SEARCH=' '
        local REPLACE='%20'
        local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
        printf '\e]7;%s\a' "$PWD_URL"
    }
    chpwd
}

# load user .zshrc configuration file
[ -f $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local

## tmux
alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias tm='tmux attach -t main || tmux new -s main; exit'

# Always work in a tmux session if tmux is installed
# https://github.com/chrishunt/dot-files/blob/master/.zshrc
#if which tmux 2>&1 >/dev/null; then
#    if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#        tmux attach -t main || tmux new -s main; exit
#    fi
#fi

# Take over tmux session
alias takeover="tmux detach -a"

#
# Start tmux on every shell login
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
#if which tmux 2>&1 >/dev/null; then
#    #if not inside a tmux session, and if no session is started, start a new session
#    test -z "$TMUX" && (tmux attach || tmux new-session)
#fi

# set hostname-related color to status-bar
#if ! [ "$TMUX" = "" ]; then
#    tmux set-option status-bg $(perl -MList::Util=sum -e'print+(red,green,blue,yellow,cyan,magenta,white)[sum(unpack"C*",shift)%7]' $(hostname)) | cat > /dev/null
#fi

# functions
git_root() {
    cd ./`git rev-parse --show-cdup`


    if [ $# = 1 ]; then
        cd $1;
    fi
}

nkfWrapper() {
  if [ $# -eq 2 ]; then
    local TMP_FILENAME='/tmp/nkfWrapper.'$$

    if [ $1 = 'euc' ]; then
      local NKF_OPTION='-e -Lu'
    elif [ $1 = 'sjis' ]; then
      local NKF_OPTION='-s -Lw'
    elif [ $1 = 'utf8' ]; then
      local NKF_OPTION='-w -Lu'
    else
      return 1
    fi

    nkf $NKF_OPTION $2 >! $TMP_FILENAME
    mv -f $TMP_FILENAME $2

  else
    return 1
  fi
}

# text-encoding: to euc
euc() {
  for i in $@;
  do
    nkfWrapper euc $i
  done
}

# text-encoding: to sjis
sjis() {
  for i in $@;
  do
    nkfWrapper sjis $i
  done
}

# text-encoding: to utf8
utf8() {
  for i in $@;
  do
    nkfWrapper utf8 $i
  done
}

encodeUrl() {
    echo "$1" | python -c 'import sys,urllib;print urllib.quote_plus(sys.stdin.readlines()[0].rstrip());'
}

decodeUrl() {
    echo "$1" | python -c 'import sys,urllib;print urllib.unquote_plus(sys.stdin.readlines()[0].rstrip());'
}

toUppercase() {
    echo "$1" | tr "[:upper:]" "[:lower:]"
}

toUppercase() {
    echo "$1" | tr "[:lower:]" "[:upper:]"
}

# gitignore.io
gi() {
    curl https://www.gitignore.io/api/$@
}

# tekito
PATH=$HOME/localpy/py3/bin:$PATH

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>='
export HISTFILE=~/.zsh_history
export HISTSIZE=999999
export SAVEHIST=999999


# peco

alias gcd='cd $(ghq root)/$(ghq list | peco)'
alias gbr='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
gmetrics() {
    open "https://console.cloud.google.com/logs/viewer?advancedFilter="$(echo $(gcloud beta logging metrics --format='table[no-heading](filter)' describe $(gcloud beta logging metrics --format='table[no-heading](NAME)' list | peco)) | python -c 'exec("try:from urllib.parse import quote_plus\nexcept ImportError:from urllib import quote_plus");import sys;print(quote_plus(sys.stdin.readlines()[0].rstrip()))')"&project="$(gcloud info --format='value(config.project)')
}

# fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
alias gcd='cd $(ghq root)/$(ghq list | fzf)'
alias gbr='hub browse $(ghq list | fzf | cut -d "/" -f 2,3)'

# Emacs
PATH=$HOME/Applications/Emacs.app/Contents/MacOS/bin:$PATH

function estart() {
    if ! emacsclient -e 0 > /dev/null 2>&1; then
        cd > /dev/null 2>&1
        $HOME/Applications/Emacs.app/Contents/MacOS/Emacs --daemon
        cd - > /dev/null 2>&1
    fi
}

alias e='emacsclient -nw'
alias ekill="emacsclient -e '(kill-emacs)'"
alias erestart="emacsclient -e '(kill-emacs)' && estart"
export EDITOR='emacsclient -nw'
#estart

# github.com/zsh-users/zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# github.com/zsh-users/zsh-autosuggestions
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

#
# JAVA
#
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

#
# Golang
#
export GOPATH=$HOME/work
export PATH=$PATH:$GOPATH/bin

#
# Flutter
#
export PATH=~/sdk/flutter/bin:$PATH

#
# k8s
#
alias k=kubectl
alias -g Kn='$(kubens | peco)'
alias -g Kp='$(k get po | peco | awk "{print \$1}")'

if (( $+commands[kubectl] )) ; then
    source <(kubectl completion zsh)
fi

if (( $+commands[kubectl] )) ; then
        source <(stern --completion zsh)
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi

#
# direnv
#
if type direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

alias h='tldr'

#
# fzf
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
