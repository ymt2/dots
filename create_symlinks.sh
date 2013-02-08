#! /bin/sh

for dotfile in .?*;
do
    case $dotfile in
	. | .. | .DS_Store | .git | .gitignore | dot.global.gitignore)
	    continue;;
	*)
	    ln -is "$PWD/$dotfile" $HOME
	    ;;
    esac
done

ln -is "$PWD/dot.global.gitignore" $HOME/.gitignore
