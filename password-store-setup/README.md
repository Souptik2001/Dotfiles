# Setup Password Manager🔑🔑

## Things that need more detailing:

- [ ] GPG key expiration.
- [ ] More errors are yet to be written.

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

- Or you can easily create the GPG key using the easy config file provided using -

```
gpg --batch --gen-key gpg-key-conf
```

- Now let's encrypt a file:
  - `gpg -e -r recipient_userid_or_email textfile`.
  - So, the output will be in a file named `prevFileName.gpg`.
- Now let's decrypth the file:

  - `gpg -o output_file_name file_to_decrypt`.

- Using the commands without a password prompt:
  - [Checkout this discussion](https://unix.stackexchange.com/questions/60213/gpg-asks-for-password-even-with-passphrase)
- Renew GPG keys:
  - [Renew GPG keys](https://gist.github.com/krisleech/760213ed287ea9da85521c7c9aac1df0)

## Setup GUI input library

- [Checkout this discussion](https://unix.stackexchange.com/questions/603682/bash-script-request-input-via-gui)
- Install `zenity` package -> `sudo pacman -S zenity`

## Setup Pass

- For the CLI tool you can use either `pass` or `gopass`. I am personally going with `pass`.
- [Official documentation of pass(Read it very carefully)](https://www.passwordstore.org/)
- [Official documentation of gopass](https://www.gopass.pw/)
- Ok so now the CLI tool has been installed. And hopefully you also got an idea of how to use the CLI tool to manage passwords.
- The next part will be more clear to you if you know about how chrome extensions work. But no knowledge will also be completely ok to follow along.
- Now we will need a bridge that communicates between the CLI and the extension. This is called `gopass-jsonapi`.
- And the browser extension is called `gopassbridge`. Don't let the nomenclature confuse you.
- First setup `gopass-jsonapi`.
  - First install golang - `sudo pacman -S go`.
  - ```bash
    git clone https://github.com/gopasspw/gopass-jsonapi.git
    cd gopass-jsonapi
    make build
    ./gopass-jsonapi help
    ```
- So this will basically create two files - Manifest File(`/home/souptik/.config/google-chrome/NativeMessagingHosts/com.justwatch.gopass.json`) and Wrapper Script(`/home/souptik/.config/gopass/gopass_wrapper.sh`), and as you can see they are placed in proper locations and therefore you don't have to do anything more with `gopass-jsonapi`. And those two are hte only files which will be needed by `gopassbridge`. If you want you can delete this `gopass-jsonapi` folder also now.
- Now download the `gopassbridge`.
  - ```bash
    https://github.com/gopasspw/gopassbridge.git
    ```
  - Install node and npm and prettier `sudo npm -g i prettier`, if you don't have these because they will be necessary during building the `gopassbridge`.
  - Build it using `make build`.
  - So, it will create a two folders, one named `chrome` and another named `firefox`. Now lastly in Google chrome use `Load unpacked` in the extensions page, and select the folder named `chrome`.

And now in ideal case you should be done. But yes its worst case a series of errors will appear and you have to solve them one by one🧐.

## Re-encrypt password store

You might sometime want to use a new GPG key pair. So, for this you need to re-encrypt all the existing passwords using the new key.
Fortunately `pass` made this task very easy for us.

- First create a new GPG key using -

```
gpg --batch --gen-key gpg-key-conf
```

- Now be sure to backup your new keys using -

```
./create_gpg_qr.sh <key_id>
```

- And just use the `init` command of pass and it will automatically re-encrypt all passwords -

```
pass init <key_id>
```

- Optionally you can delete your old key(if you don't have any other dependencies) -

```
gpg --delete-secret-keys <key_id>
gpg --delete-keys <key_id>
```

## Password store internals

- By default the "Password Store" stores all the passwords at `~/.password-store`.
- The folder basically is a git repository.
- In that folder only there is a file named `.gpg-id` where it stores the ID of the GPG key, which is to be used to encrypt-decrypt passwords.

## Errors with gopassbridge and gopass-jsonapi

- `"Access to the specified native messaging host is forbidden."`
  - In the Manifest file created during setting up gopass-jsonapi above, in the allowed origins write your chrome extension ID.
  - [Discussion](https://stackoverflow.com/questions/20216224/chrome-native-messaging-error-access-to-the-specified-native-messaging-host-i)
- `"Failed to decrypt"`

  - This happens because the GPG key needs to have the passpharse to use the private key.
  - So, if the passphrase is not cached it is not able to take the passphrase input.
  - Ok, so understand the solution very carefully.
  - So, basically you are interacting with the `gpg-agent` daemon to interact with the main gpg program. Now by default (i.e if you don't specify a `~/.gnupg/gpg-agent.conf` file) it uses the takes your passphrase in the terminal only(I don't remember the name exactly). But that is program is for some reason not so much usable by other programs. So, you need to provide a pin-entry program.
  - In my arch (Endeveour OS) I already have a preinstalled pin-entry program called `pinentry-qt`🤯. But if you don't have you can install [it](https://archlinux.org/packages/core/x86_64/pinentry/) with `sudo pacman -S pinentry-qt`.
  - Now we just need to tell `gpg-agent` to use this pin-entry program. And we can do this by entering this to our `~/.gnupg/gpg-agent.conf` file. Append this line in the file(if you don't have one then create):

  ```conf
  pinentry-program /abs/path/to/your/pinentry-program
  ```

  Or just execute this command:

  ```bash
  echo "pinentry-program $(which your_pinentry_program)" >> ~/.gnupg/gpg-agent.conf
  ```

  And then just kill the gpg-agent program:

  ```bash
  killall gpg-agent
  ```

  The `gpg-agent` will be started by the gopass-jsonapi itself you don't have to worry.

- `"Copy to clipboard failed"`
  - For that install the `xclip` command - `sudo pacman -S xclip`.

## Backup your GPG keys properly📜

- First export your public and private keys:
  ```bash
  gpg --output pass_private.key --armor --export-secret-keys souptikdatta2001@gmail.com
  gpg --output pass_public.key --armor --export souptikdatta2001@gmail.com
  ```
- Now you have to convert these files into qr codes. But GPG keys are very large and even if you convert them into QR codes then they will be very fine and detailed and, when you will print them in paper. So, you need to split them into smaller files nad then convert each of them into QR codes.
- We will first split the file using the `split` command.
- Then we will convert the files in qr codes using the `qrencode` command.
- If you don't want to manually run the commands I wrote a bash script which you can use like `./create_gpg_qr.sh <userID_or_email>`.
- Same way you can also convert your ssh keys into QR codes using the other bash script `./create_ssh_qr.sh <path_to_private_key> <path_to_public_key>`.
- And now arrange those QR codes in a A4 sheet and take a print out of that and put it with your very important documents like birth-certificate of something. So, that even if the files are deleted from your computer you will be able to scan those QR and get your GPG key back.

## Let's utilize the backup🧐

- Now you are ready with your QR codes.
- Let's suppose now you loose your GPG keys from your computer.
- So, let's mock that situation. Let's manually delete the public and private keys.
  [Good article on how to delete GPG keys](https://linuxhint.com/delete-gpg-keys-linux/)
  Basically two commands - `gpg --delete-secret-key [uuid_or_Key_ID]` and `gpg --delete-key [uuid_or_key_ID]`.
  As you can see here you have to delete the secret key first because if there is a secret key corresponding to a private key, then the secret key is to be deleted first and then the public key.
- Ok now the keys are deleted.😥 Hopefully you took the backup before this. Please say you did.🤯
- Now let's restore the backup.
- Again simple two commands - `gpg --import [path_to_public_key]` and `gpg --import [path_to_private_key]`.
- But importing the public key is not enough. You might get an error saying = `unusable public key`.
- And yes again if you don't want to do it manually then you can use the restore script - `./restore_gpg_qr.sh <path_containing_qr_codes_in_proper_exported_format_using_create_gpg_qr_sh_script>`. **The path you provided must be in the format the backup script generate. So, its best to use those two together.**

[This article is very helpful demonstrating exporting and importing public and private keys.](https://linuxhint.com/export-import-keys-with-gpg/)

## Migrating passwords from chrome to password-store

- This is your [helper](https://github.com/roddhjav/pass-import).
- Ok, let me explain now.
- Basically this command-line tool allows you to import passwords to pass from an extensive range of famous passwords manager.
- Read the readme provided carefully.
- Basically first export your chrome passwords to a csv file.
- And then run the following command.
- Install `pass-import` - `yay -S pass-import`.
- And that's it run this command.
  ```
  pass import chrome /path/to/the/exported/csv/file
  ```

## Exporting and re-importing the passwords

Previously you learned how to import passwords from chrome and import them into password-store. But now let's see how you can export your password store's passwords and then re-import them.
_To Do.._

## Useful modules

- `pass-update`
- `pass-import`.
  If you get a error installing it, something with the yaml folder in the python packages then just simply delete those folders which are causing the conflicts.
