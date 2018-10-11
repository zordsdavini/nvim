#!/bin/bash

PWD=`pwd`

mkdir backup undo session

cd ~
ln -s $PWD/init.vim .vimrc
ln -s $PWD .vim

