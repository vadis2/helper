#!/bin/bash

echo "Welcome!"
function check_done
if [ $? -eq 0 ]
  then
   printf "\e[32m$1 is completed\e[0m\n"
  else
    sleep 5s
    if [ $? -eq 0 ]
      then
        printf "$1 is completed\n"
      else
        printf "$1 is not completed\n"
        exit 1
    fi
fi

printf "Enter your new domain, please with capitalized first symbol:\n"
read domain
printf "Domain is "$domain"\n"

echo Please, enter your Domain Name \(Capitalize First symbol\)
mkdir -p $domain
check_done "Create domain directory"

DirList="Actions QueryBuilders Collections DataTransferObjects Events Exceptions Listeners Models Rules States"
for dir in $DirList;
do
  sudo mkdir -p $domain/$dir
  check_done "Create domain directory "$dir
done

printf "Task is completed\n"


