{ config, pkgs, ... }:
{
	programs.gpg = {
		enable = true;
	};

	services.gpg-agent = {
		enable = true;
		pinentryFlavor = "gnome3";
		enableSshSupport = true;
	};

	# Currently this will not work, because seems like GNUPG is not setup at this point.
	home.activation = {
		# We have to run this at the beginning, therefore prefixing it with `a`.
		a_gpgKeysSetup = ''
		ls ~/.gnupg/
		# Import public key.
		${pkgs.gnupg}/bin/gpg --import ~/nix-secrets/gpg/public.key
		# Import private key.
		${pkgs.gnupg}/bin/gpg --import ~/nix-secrets/gpg/private.key
		# Import trust DB.
		${pkgs.gnupg}/bin/gpg --import-ownertrust ~/nix-secrets/gpg/trust-db.txt
		'';
	};
}