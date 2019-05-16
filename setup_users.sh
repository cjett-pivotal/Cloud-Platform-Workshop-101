#!/bin/bash

if [ $# -eq 1 ]; then
  > users
  counter=1
  while [ $counter -le $1 ]
  do
    echo "user${counter}" >> users
    PASS="$(openssl rand -base64 6)"
    echo "${PASS}" >> users
    cf create-user "user${counter}" "${PASS}"
    cf set-space-role "user${counter}" Home Lab SpaceDeveloper
    ((counter++))
    echo "" >> users
  done
else
    echo "Script needs a single input i.e. setup_users.sh 1"
fi

echo All done
