#!/usr/bin/env bash

arr=()
arr[0]="github.com"
arr[1]="gist.github.com"
arr[2]="user-images.githubusercontent.com"
arr[3]="assets-cdn.github.com"
arr[4]="raw.githubusercontent.com"
arr[5]="gist.githubusercontent.com"
arr[6]="cloud.githubusercontent.com"
arr[7]="camo.githubusercontent.com"
arr[8]="avatars.githubusercontent.com"

echo -e "#### github hosts #### \n#from https://github.com/baiyutang/github-ips\n" >hosts
for domian in ${arr[*]}; do
  echo "$domian"
  ip=$(host "$domian" | grep "has address" | awk '{ print $4}')
  num=$(echo "$ip" | wc -l)
  if [[ $num -gt 1 ]]; then
    for i in $(echo $ip); do
      echo "$i $domian" >>hosts
    done
    continue
  fi
  echo "$num"
  echo "$ip $domian" >>hosts
done
echo "#### github hosts ####" >>hosts
