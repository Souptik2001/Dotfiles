# Setup WordPress easily with Lando

## Installation :

```bash
wget https://files.lando.dev/installer/lando-x64-stable.pacman
sudo pacman -U lando-x64-stable.pacman
```

You can also check the official installation documentation : [Lando Installation](https://docs.lando.dev/basics/installation.html#linux).

## Setting up WordPress with Lando! :

First we have to create a `.lando.yml` file. You can create this manually. For that first study how to write a `.lando.yml` file. It's a simple yaml file, but you have to study all the options available.
But here we will create file with `lando init` command. And from there we will select `wordpress` as the `recipe`. Recipes can be considered as docker images. So here we will use the `wordpress` recipe which will contain all the things related to WordPress, like database, etc.

```bash
lando init
```

- First select `wordpress` as the recipe.
- Next question will be what is your webroot relative to the init destination? This is the main installation directory of wordpress. That is the local volume of the wordpress container.
- Next is the name of the application.

And that's it. The `.lando.yml` file is created.

Now let's start up the application. Which is just like starting up the docker containers.

```bash
lando start
```

Now here there could be an error.

Install [`libxcrypt-compat`](https://aur.archlinux.org/packages/libxcrypt-compat) :
```bash
yay -S libxcrypt-compat
```

To fix this uninstall docker-compose :
```bash
sudo rm -r /usr/local/bin/docker-compose
```
And install docker-compose with pip :
```bash
sudo pip install docker-compose
```

Now you use `docker ps` and see all the containers started.
Use `docker volume ls` to see the volumes.
And `docker network ls` to see the networks.
