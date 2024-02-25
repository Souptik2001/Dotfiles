{ config, pkgs, ... }: {
	programs.ssh = {
		enable = true;
		extraConfig = ''
			Host rtTraining
				User root
				ServerAliveInterval 60
				ServerAliveCountMax 60
				IdentityFile /home/souptik/.ssh/keys/git_key/git_key
				HostName tr.rt.gw
			Host rt
				User root
				ServerAliveInterval 60
				ServerAliveCountMax 60
				IdentityFile /home/souptik/.ssh/keys/git_key/git_key
				HostName rt.gw
			Host github.com
				HostName github.com
				IdentityFile /home/souptik/.ssh/keys/git_key/git_key
			Host rtlearn
				User root
				ServerAliveInterval 60
				ServerAliveCountMax 60
				HostName learn.do.rstuff.in
				IdentityFile /home/souptik/.ssh/keys/git_key/git_key
			Host *.drush.in
				IdentityFile /home/souptik/.ssh/keys/pantheon_key/pantheon_key
			Host aur.archlinux.org
				IdentityFile /home/souptik/.ssh/keys/git_key/git_key
				User aur
		'';
	};

	# Do this every time home-manager is activated.
	home.activation = {
		# We have to run this at the beginning, therefore prefixing it with `a`.
		a_sshKeysSetup = ''
		if [ -d ~/nix-secrets/ssh/keys/ ]; then
			cp -r ~/nix-secrets/ssh/keys/ ~/.ssh/keys/
			chmod 700 ~/.ssh/keys/ -R
		fi
		'';
	};
}