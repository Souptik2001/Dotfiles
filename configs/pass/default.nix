{ config, pkgs, ... }: {
	# Do this every time home-manager is activated.
	home.activation = {
		passwordStore = ''
		PW_DIR=${config.home.homeDirectory}/.password-store

		if [ ! -d "$PW_DIR" ]; then
			mkdir -p "$PW_DIR"
		fi
		cd $PW_DIR

		# the following PATH addition is to make sure that binaries like `git`, `emacs`, `ssh` are available for use
		export PATH="${config.home.path}/bin:/run/current-system/sw/bin:/etc/profiles/per-user/${config.home.username}/bin:$PATH"

		git init
		# if the remote origin is already present, then just make sure that it points to the correct repo, else add the remote.
		if git remote | grep -q origin; then
			git remote set-url origin git@github.com:Souptik2001/Pass.git
		else
			git remote add origin git@github.com:Souptik2001/Pass.git
		fi

		# fetch and pull the latest changes from the remote, so that our passwords are updated!
		git fetch origin
		git pull origin master

		echo "Y" | gopass-jsonapi configure --browser chrome --global=false --path=${config.home.homeDirectory}/.config/gopass
		# right now I don't need for firefox, so let's not do this one.
		# echo "Y" | gopass-jsonapi configure --browser firefox --global=false --path=${config.home.homeDirectory}/.config/gopass
		'';
	};
}