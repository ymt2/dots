#!/usr/bin/env zsh

function log() {
    local fname="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")" && pwd)"
    echo "$(date '+%Y-%m-%dT%H:%M:%S') ${PROCNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $@"
}

for dot in dot.?*;
do
    file_name=`echo $dot | sed -e "s/^dot\./\./"`

    if [ -d $HOME/$file_name ]; then
        log "skip: ${HOME}/${file_name}"
        continue
    fi

    ln -is $PWD/$dot $HOME/$file_name
done

touch $PWD/dot.config/zsh/.zshrc.local

git submodule init && git submodule update
