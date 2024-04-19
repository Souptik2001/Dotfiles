# This is a complete mess -- need to refactor soon.


{ config, pkgs, lib, ... }:

{
	# Create a config.rasi file and ge tthe required theme here.
	home.file.".config/rofi/config.rasi".text = ''
		@theme "${pkgs.rofi-unwrapped}/share/rofi/themes/gruvbox-dark-soft.rasi"
	'';
}