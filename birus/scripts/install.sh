!/bin/bash

echo "INFO    Configure french keyboard"
loadkeys fr

echo "INFO    Configure time dans date"
timedatectl set-ntp true

echo "INFO    Configure mirrors"
curl -s "https://www.archlinux.org/mirrorlist/?country=FR" | sed 's/#Server/Server/g' > /etc/pacman.d/mirrorlist

devices=$(lsblk | tail -n +2 | grep -o "^[A-Za-z]\+")

echo "INFO    Select root device:"
select ans in $devices; do
  if [ -z $ans ]; then
    echo "You must select a device"
    continue
  fi
  dev=/dev/$ans
  break
done

bootdev="$dev"1
rootdev="$dev"2
swapdev="$dev"3

source ./install/10-core
