## Follow this to set-up PHP and Composer(used to install any PHP packages)

- First install PHP.
- Then just run this `install-composer.sh` file to install and setup composer. These are the actions performed by the `install-composer.sh` file:
  - Basically this script downloads a php file. That PHP file when executed will download a PHAR file. A PHAR file is like a binary file which can be directly executed as a command. Then this PHAR file is moved to `/usr/local/bin` with the name `composer` so that we can run the file from anywhere in the terminal with the command `composer`.
- Now, add `~/.config/composer/vendor/bin/` in the PATH environment variable in `.zshrc` or `.bashrc`. Because any package you install with Composer will be installed here and if, you want to run them just like a command from anywhere in the terminal then you need that PATH environment variable.