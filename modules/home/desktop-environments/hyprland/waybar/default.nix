{ lib, config, ...}:
{
	options = {
		waybar.enable = lib.mkEnableOption "enables waybar";
	};

	config = lib.mkIf config.waybar.enable {
		xdg.configFile = {
			"waybar" = {
				source = ./config;
				recursive = true;
			};
		};

		programs.waybar.enable = true;
	};
}