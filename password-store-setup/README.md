# Setup Password Manager🔑🔑

## Setup GNUPG

- [Arch Linux GNUPG official documentation](https://wiki.archlinux.org/title/GnuPG)
- [Arch Linux GNUPG download page](https://archlinux.org/packages/core/x86_64/gnupg/)
- [Useful commands in GNUPG like exporting importing both type of keys, i.e basically managing the keys and also other commands](https://kb.iu.edu/d/awiu)
- [Might be useful if you have not read the above mentioned documentations🤫](https://superuser.com/questions/814409/gnupg-opengpg-recovering-public-key-from-private-key)
- Download GNUPG:
  ```bash
  sudo pacman -S gnupg
  ```
- When you start creating keys, GNUPG will by default create all the keys in the user's home directory's `.gnupg` named folder.
- But if you want your `.gnupg` folder to be elsewhere use:
  ```bash
  export GNUPGHOME=/abs/path/to/the/folder
  ```
- Another thing is that you may get a `unsafe permission` error. To resolve that set the folders permission to `0700` which means that only the owner have full access any other user will have no access.
- Now list out your keys using:
  ```bash
  gpg --list-keys
  ```
- Now let's create our GPG key:
  ```bash
  gpg --full-generate-key
  ```
  - Select `RSA and RSA encryption`.
  - Keysize - `4096`.
  - Next select expiration time for the key. `0` if you want no expiration.
  - Next enter real name.
  - Enter email address.

- Now let's encrypt a file:
  - `gpg -e -r recipient_userid_or_email textfile`.
  - So, the output will be in a file named `prevFileName.gpg`.
- Now let's decrypth the file:
  - `gpg -o output_file_name file_to_decrypt`.

- Using the commands without a password prompt:
  - [Checkout this discussion](https://unix.stackexchange.com/questions/60213/gpg-asks-for-password-even-with-passphrase)
- Renew GPG keys:
  - [Renew GPG keys](https://gist.github.com/krisleech/760213ed287ea9da85521c7c9aac1df0)
  - 

## Setup auto keys refresh

### Setup GUI input library

- [Checkout this discussion](https://unix.stackexchange.com/questions/603682/bash-script-request-input-via-gui)
- Install `zenity` package -> `sudo pacman -S zenity`