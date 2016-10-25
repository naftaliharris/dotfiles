#!/bin/bash
# Run this to install your dotfiles.

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

files=$(ls -A $BASEDIR | grep -v -x -f $BASEDIR/dont_link.txt)

for file in $files
do
    if [[ -d $BASEDIR/$file ]]
    then
        rm -r -f $HOME/$file
    fi
    ln -s -f $BASEDIR/$file $HOME/$file
done
