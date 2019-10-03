export ZDOTDIR=$HOME/.config/zsh

export XDG_CONFIG_HOME="$HOME/.config"

# AWS CLI
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# tig
export TIGRC_USER="$XDG_CONFIG_HOME/tig/tigrc"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
