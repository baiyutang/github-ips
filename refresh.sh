#!/usr/bin/env bash
arr=("github.com" "gist.github.com" "user-images.githubusercontent.com" "assets-cdn.github.com" "raw.githubusercontent.com"
  "gist.githubusercontent.com" "cloud.githubusercontent.com" "camo.githubusercontent.com" "avatars.githubusercontent.com")
echo "---- github hosts---- \nfrom https://github.com/baiyutang/github-ips\n" >hosts
for domian in $arr; do
  ip=$(host "$domian" | grep "has address" | awk '{ print $4}')
  num=$(echo "$ip" | wc -l)
  if [[ $num -gt 1 ]]; then
    for i in $(echo $ip); do
      echo "$i $domian" >>hosts
    done
    continue
  fi

  echo "$ip $domian" >>hosts
done
echo "---- github hosts----" >>hosts
