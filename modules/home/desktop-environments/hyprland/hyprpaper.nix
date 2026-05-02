{ lib, config, ...}: 
let
	wallpapersPath = "${config.home.homeDirectory}/.nixos/home/desktop-environments/wallpapers";
in {
    options = {
        hyprpaper.enable = lib.mkEnableOption "enables hyprpaper";
    };

    config = lib.mkIf config.hyprpaper.enable {
      	services.hyprpaper = {
			enable = true;
			settings = {
				preload = [
					"${wallpapersPath}/nix-black-4k.png"
				];
				wallpaper = [
					{
						monitor = "";
						path = "${wallpapersPath}/nix-black-4k.png";
					}
				];
				ipc = "off";
			};
      	};
	};		
}