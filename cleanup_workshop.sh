#!/bin/bash
USERS="$(cf space-users DNA workshop | sed -e '1,/DEVELOPER/d; /AUDITOR/,$d'|grep user)"
for USER in $USERS
do
    echo $USER
    cf delete-user ${USER} -f
    ((counter++))
done
cf delete-space workshop  -o DNA -f
