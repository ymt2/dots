#! /bin/sh

for dot in dot.?*;
do
    file_name=`echo $dot | sed -e "s/^dot\./\./"`
    ln -is $PWD/$dot $HOME/$file_name
done

git submodule init && git submodule update
