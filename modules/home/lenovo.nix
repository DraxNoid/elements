{ inputs, config, lib, pkgs, ...}:

let
	homePath = "${config.home.homeDirectory}/.nixos/home/";
in
{
	imports = [
		./default.nix
	];
	home.username = "draxnoid";
	home.homeDirectory = "/home/draxnoid";
	home.stateVersion = "24.05";	

    home.packages = with pkgs; [
		home-manager
		nerd-fonts.jetbrains-mono
    ];

	catppuccin = {
		enable = true;
		flavor = "mocha";
	};

    programs.home-manager.enable = true;
	fonts.fontconfig.enable = true;
    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };
}
