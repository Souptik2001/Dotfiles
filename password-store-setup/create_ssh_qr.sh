#! /bin/bash

## Usage
# ./create_ssh_qr.sh <path_to_folder> <key_name>
# A folder will be created in the current directory named ssh_qr_<key_name>
##

if test -z "$1" || test -z "$2"
then
      echo "Please check the usage of the script - ./create_ssh_qr.sh <path_to_folder> <key_name>"
	  exit 1
fi

rm -r ssh_qr_"$2"

## Export the private and public keys
mkdir ssh_qr_"$2"

## Split the public and private keys to smaller parts
mkdir ./ssh_qr_"$2"/private-ssh-splits
mkdir ./ssh_qr_"$2"/public-ssh-splits
split -C 1000 "$1/$2" ./ssh_qr_"$2"/private-ssh-splits/privatesplitkey-
split -C 1000 "$1/$2.pub" ./ssh_qr_"$2"/public-ssh-splits/publicsplitkey-

# ## Convert them into QR codes
mkdir ./ssh_qr_"$2"/private-ssh-splits-qr
mkdir ./ssh_qr_"$2"/public-ssh-splits-qr

count=1
for file in ./ssh_qr_"$2"/private-ssh-splits/privatesplitkey-??; do
	padded_count=$(printf '%02d\n' "$count")
	<"$file" qrencode -s 3 -d 150 -o ./ssh_qr_"$2"/private-ssh-splits-qr/private-"$padded_count".png
	((count+=1))
done

count=1
for file in ./ssh_qr_"$2"/public-ssh-splits/publicsplitkey-??; do
	padded_count=$(printf '%02d\n' "$count")
	<"$file" qrencode -s 3 -d 150 -o ./ssh_qr_"$2"/public-ssh-splits-qr/public-"$padded_count".png
	((count+=1))
done
