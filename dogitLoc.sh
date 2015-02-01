#!/bin/bash
clear
echo "dogitLoc ..."

init_repo () {

  if [ -z "$1" ]; then
    GITDIR="/Users/user/Google-Drive/_git"
  else
    GITDIR=$1
  fi

  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  REP=$(basename $DIR)
  echo "Creating Repository:" $GITDIR/$REP

  cd $GITDIR
  sudo git init --bare $REP.git

  cd $DIR
  sudo git init
  sudo touch README.md
  sudo git add .
  sudo git commit README.md -m "Dogit commit."
  sudo git remote add origin file://$GITDIR/$REP.git
  sudo git push origin master
}

while true; do
    read -p "You Google Drive Git Directory (Default: ~/Google-Drive/_git) ?" L
    init_repo $L
    break
done
