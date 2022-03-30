# Setup Password Manager🔑🔑

## Setup GNUPG

- [Arch Linux GNUPG official documentation](https://wiki.archlinux.org/title/GnuPG)
- [Arch Linux GNUPG download page](https://archlinux.org/packages/core/x86_64/gnupg/)
- [Useful commands in GNUPG like exporting importing both type of keys, i.e basically managing the keys and also other commands](https://kb.iu.edu/d/awiu)
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