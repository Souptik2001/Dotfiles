#! /bin/bash

## Export the private and public keys
rm -r gpg_qr_"$1"
mkdir gpg_qr_"$1"
gpg --output ./gpg_qr_"$1"/private.key --armor --export-secret-keys $1
gpg --output ./gpg_qr_"$1"/public.key --armor --export $1

## Split the public and private keys to smaller parts
rm -r ./gpg_qr_"$1"/private-gpg-splits
rm -r ./gpg_qr_"$1"/public-gpg-splits
mkdir ./gpg_qr_"$1"/private-gpg-splits
mkdir ./gpg_qr_"$1"/public-gpg-splits
split -C 500 ./gpg_qr_"$1"/private.key ./gpg_qr_"$1"/private-gpg-splits/privatesplitkey-
split -C 500 ./gpg_qr_"$1"/public.key ./gpg_qr_"$1"/public-gpg-splits/publicsplitkey-

## Convert them into QR codes
rm -r ./gpg_qr_"$1"/private-gpg-splits-qr
rm -r ./gpg_qr_"$1"/public-gpg-splits-qr
mkdir ./gpg_qr_"$1"/private-gpg-splits-qr
mkdir ./gpg_qr_"$1"/public-gpg-splits-qr

count=1
for file in ./gpg_qr_"$1"/private-gpg-splits/privatesplitkey-??; do
	<"$file" qrencode -s 3 -d 150 -o ./gpg_qr_"$1"/private-gpg-splits-qr/private-"$count".png
	((count+=1))
done

count=1
for file in ./gpg_qr_"$1"/public-gpg-splits/publicsplitkey-??; do
	<"$file" qrencode -s 3 -d 150 -o ./gpg_qr_"$1"/public-gpg-splits-qr/public-"$count".png
	((count+=1))
done