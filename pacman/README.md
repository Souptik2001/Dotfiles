## Auto pacman cache clear

Copy this file to `/etc/pacman.d/hooks` folder. This will automaticall clear all both installed and uninstalled package cache from `/var/cache/pacman/pkg` folder.

So, after every transaction this command should return 0 number of lines -
```
sudo ls /var/cache/pacman/pkg/ | wc -l
```

