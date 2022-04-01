#! /bin/bash

## Export the private and public keys
mkdir ssh_qr_key

## Split the public and private keys to smaller parts
rm -r ./ssh_qr_key/private-ssh-splits
rm -r ./ssh_qr_key/public-ssh-splits
mkdir ./ssh_qr_key/private-ssh-splits
mkdir ./ssh_qr_key/public-ssh-splits
split -C 1000 "$1" ./ssh_qr_key/private-ssh-splits/privatesplitkey-
split -C 1000 "$2" ./ssh_qr_key/public-ssh-splits/publicsplitkey-

## Convert them into QR codes
rm -r ./ssh_qr_key/private-ssh-splits-qr
rm -r ./ssh_qr_key/public-ssh-splits-qr
mkdir ./ssh_qr_key/private-ssh-splits-qr
mkdir ./ssh_qr_key/public-ssh-splits-qr

count=1
for file in ./ssh_qr_key/private-ssh-splits/privatesplitkey-??; do
	<"$file" qrencode -s 3 -d 150 -o ./ssh_qr_key/private-ssh-splits-qr/private-"$count".png
	((count+=1))
done

count=1
for file in ./ssh_qr_key/public-ssh-splits/publicsplitkey-??; do
	<"$file" qrencode -s 3 -d 150 -o ./ssh_qr_key/public-ssh-splits-qr/public-"$count".png
	((count+=1))
done