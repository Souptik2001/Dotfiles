#! /bin/bash

## Usage instruction
# ./restore_gpg_qr.sh <path_containing_qr_codes_in_proper_exported_format_using_create_gpg_qr_sh_script>
##

# Remove the tmp folder if present.
rm -r tmp

# Create the tmp folder.
mkdir tmp

mkdir tmp/public_splits
mkdir tmp/private_splits

# Decode the qr codes into text files.
count=1
for file in "$1"/public-gpg-splits-qr/*; do
	echo $file
	padded_count=$(printf '%02d\n' "$count")
	zbarimg "$file" --raw > tmp/public_splits/publicsplitkey-"$padded_count"
	sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' tmp/public_splits/publicsplitkey-"$padded_count"
	((count+=1))
done

count=1
for file in "$1"/private-gpg-splits-qr/*; do
	echo $file
	padded_count=$(printf '%02d\n' "$count")
	zbarimg "$file" --raw > tmp/private_splits/privatesplitkey-"$padded_count"
	sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' tmp/private_splits/privatesplitkey-"$padded_count"
	((count+=1))
done

# Join the splits of the key into single file. - Two files created one for public and another for private key.
cat tmp/public_splits/publicsplitkey* > tmp/public.key
cat tmp/private_splits/privatesplitkey* > tmp/private.key

# Import the keys.
gpg --import tmp/public.key
gpg --import tmp/private.key

# Decode trust DB.
zbarimg "$1"/trust-db/trust-db.png --raw > tmp/trust-db.txt
sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' tmp/trust-db.txt

# Import trust DB.
gpg --import-ownertrust tmp/trust-db.txt

# Cleanup - Remove the tmp folder.
rm -r tmp
