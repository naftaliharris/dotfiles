#!/bin/bash
# Run this to install your dotfiles.

set -e


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

# Do this last so that if it fails (e.g. if IPython isn't installed), we've
# still done the previous stuff.
ipython create profile
file=ipython_config.py
ln -s -f $BASEDIR/$file $(ipython locate profile)/$file
