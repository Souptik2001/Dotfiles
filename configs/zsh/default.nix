{ config, pkgs, ... }:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		enableAutosuggestions = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
			# Enable unicode encoding in tmux
			tmux = "tmux -u";
		};
		history.size = 10000;
		history.path = "${config.xdg.dataHome}/zsh/history";

		oh-my-zsh = {
			enable = true;
			theme = "fletcherm";
			plugins = [
				"git"
			];
		};
	};
}
