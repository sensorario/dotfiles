#!/bin/bash
echo What is your name?
read committer_user
echo What is your email?
read committer_email
sed "s/{{committer_user}}/$committer_user/g" <./gitconfig.dist >./temp
sed "s/{{committer_email}}/$committer_email/g" <./temp >./gitconfig
rm ./temp
echo ""
echo "Overriding gitconfig file"
cp -f $PWD/gitconfig ~/.gitconfig
rm ./gitconfig
cp -f $PWD/gitignore ~/.gitignore;
