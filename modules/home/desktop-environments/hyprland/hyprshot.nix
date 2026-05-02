{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        hyprshot.enable = lib.mkEnableOption "enables hyprshot";
    };

    config = lib.mkIf config.hyprshot.enable {
        home.packages = [ pkgs.hyprshot ];
	};		
}