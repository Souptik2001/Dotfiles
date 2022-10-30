#! /bin/bash

## Usage
# ./create_gpg_qr <gpg_key_id_or_email>
# A folder will be created in the current directory named gpg_qr_<gpg_key_id_or_email>
##

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
	padded_count=$(printf '%02d\n' "$count")
	<"$file" qrencode -s 3 -d 150 -o ./gpg_qr_"$1"/private-gpg-splits-qr/private-"$padded_count".png
	((count+=1))
done

count=1
for file in ./gpg_qr_"$1"/public-gpg-splits/publicsplitkey-??; do
	padded_count=$(printf '%02d\n' "$count")
	<"$file" qrencode -s 3 -d 150 -o ./gpg_qr_"$1"/public-gpg-splits-qr/public-"$padded_count".png
	((count+=1))
done

# Backup trust DB

mkdir ./gpg_qr_"$1"/trust-db

gpg --export-ownertrust > ./gpg_qr_"$1"/trust-db/trust-db.txt

<./gpg_qr_"$1"/trust-db/trust-db.txt qrencode -s 3 -d 150 -o ./gpg_qr_"$1"/trust-db/trust-db.png

rm ./gpg_qr_"$1"/trust-db/trust-db.txt

# Cleanup - Remove everything other than just the QR codes.

rm ./gpg_qr_"$1"/private.key
# Only not removing the public key as that might be needed somewhere.

rm -r ./gpg_qr_"$1"/private-gpg-splits
rm -r ./gpg_qr_"$1"/public-gpg-splits
