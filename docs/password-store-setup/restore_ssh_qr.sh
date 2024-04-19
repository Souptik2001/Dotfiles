#! /bin/bash

## Usage instruction
# ./restore_ssh_qr.sh <path_containing_qr_codes_in_proper_exported_format_using_create_ssh_qr_sh_script> <key_name>
##

# Remove the tmp folder if present.
rm -r "$2"

# Create the tmp folder.
mkdir "$2"

mkdir "$2"/public_splits
mkdir "$2"/private_splits

# Decode the qr codes into text files.
count=1
for file in "$1"/public-ssh-splits-qr/*; do
	echo $file
	padded_count=$(printf '%02d\n' "$count")
	zbarimg "$file" --raw > "$2"/public_splits/publicsplitkey-"$padded_count"
	sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$2"/public_splits/publicsplitkey-"$padded_count"
	((count+=1))
done

count=1
for file in "$1"/private-ssh-splits-qr/*; do
	echo $file
	padded_count=$(printf '%02d\n' "$count")
	zbarimg "$file" --raw > "$2"/private_splits/privatesplitkey-"$padded_count"
	sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$2"/private_splits/privatesplitkey-"$padded_count"
	((count+=1))
done

# Join the splits of the key into single file. - Two files created one for public and another for private key.
cat "$2"/public_splits/publicsplitkey* > "$2"/"$2".pub
cat "$2"/private_splits/privatesplitkey* > "$2"/"$2"

rm -r "$2"/public_splits
rm -r "$2"/private_splits

chmod 600 "$2"/"$2"

# Try to copy to .ssh directory
mv "$2" ~/.ssh/keys
