#!/bin/sh

#check pwd
if [ $(dirname $0) != "." ]
then
	echo "Script should be started from local dir"
	exit
fi

#select user
echo "User name:"
read user_name
echo "you select user "$user_name
home_path=/home/$user_name

if [ ! -e $home_path ]
then
	echo $home_path" does't exist. Exit!"
	return
fi

#install vimrc
if [ -e $home_path/.vimrc ]
then
	echo $home_path"/.vimrc found, it will be erase, please save it."
	read z
fi
rm $home_path/.vimrc
ln -s $PWD/vimrc $home_path/.vimrc

#install vim
if [ -e $home_path/.vim ]
then
	echo $home_path"/.vim found, it will be erase, please save it."
	read z
fi
rm -r $home_path/.vim
ln -s $PWD/vim $home_path/.vim

#install plugin
rm -rf vim/bundle/*
cat module.list | while read line
do
	cd vim/bundle
	git clone $line
	cd ../.. 
done
