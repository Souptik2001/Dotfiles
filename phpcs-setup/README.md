The entire PHPCS setup is already done in the `.config/composer` folder. You just have to add `~/.config/composer/vendor/bin/` in the PATH environment variable in `.zshrc` or `.bashrc`.

Better have Composer installed before installing PHPCS.

First get PHPCS -
```
cd ~/.composer
cd ~/.config/composer
composer global require "squizlabs/php_codesniffer=*"
composer update squizlabs/php_codesniffer
```

Now you can access PHPCS by specifying the absolute path i.e `~/.composer/vendor/bin/phpcs`. But if you want to access it from anywhere without by just writing `phpcs` the add this path to the PATH environment variable to your `.bashrc` or `.zshrc` file.

Now you have to install WPCS and PHPCompatibility.

With composer its just one command:

```
composer global require dealerdirect/phpcodesniffer-composer-installer \
	automattic/vipwpcs \
	phpcompatibility/php-compatibility \
	phpcompatibility/phpcompatibility-wp:* --update-no-dev
```

But if you want to do that manually without composer then you have to do something like this:

```
cd ~/Documents
mkdir Coding-Standards && cd $_
git clone -b master https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git wpcs
git clone -b master https://github.com/Automattic/VIP-Coding-Standards.git
git clone -b master https://github.com/wimg/PHPCompatibility.git PHPCompatibility
pwd # copy this
ln -s {paste here}/PHPCompatibility/PHPCompatibility wpcs/PHPCompatibility
ln -s {paste here}/VIP-Coding-Standards/WordPressVIPMinimum wpcs/WordPressVIPMinimum
phpcs --config-set installed_paths {Paste here again}/wpcs # remember this path
```

Notice that you didn't need to set `installed_paths` when used with the composer as `dealerdirect/phpcodesniffer-composer-installer` will take care of it.
