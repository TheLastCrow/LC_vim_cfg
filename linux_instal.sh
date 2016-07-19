#!/bin/sh

#check pwd
if [ $(dirname $0) != "." ]
then
	echo "Script should be started from local dir"
	exit
fi


#set home_path
home_path=$HOME

echo "HOME path used will be :"$home_path
echo "Do you want use this HOME path ? [y/n]"
read z
if [ $z != 'y' ]
then
    echo "enter HOME wanted path:"
    read z
    home_path=$z
fi

if [ ! -e $home_path ]
then
	echo $home_path" does't exist. Exit!"
	return
fi


#uninstall vim and vimrc
if [ -e $home_path/.vimrc ] || [ -e $home_path/.vim ] 
then
	echo "Warning: .vimrc or/and .vim in "$home_path" found. They will be erased, please save it if needed."
    echo "Do you want to continue ? [y/n]"
	read z
    if [ $z != 'y' ]
    then
        echo "Instal cancelled!"
        return 0
    fi
fi
rm $home_path/.vimrc
rm -rf $home_path/.vim
echo "Old conf deleted"


#install new vimrc
touch $home_path/.vimrc

echo "set runtimepath^="$PWD"/vim" > $home_path/.vimrc 
echo "source "$PWD"/vimrc" >> $home_path/.vimrc

echo "New vimrc file generated"

#pull git plugin
echo "Do you want pull modules from git ? [y/n]"
read z
if [ $z != 'y' ]
then
    echo "No pull requested, install finished"
    return 0
fi

rm -rf vim/bundle/*
cat module.list | while read line
do
	cd vim/bundle
	git clone $line
	cd ../.. 
done
