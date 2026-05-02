{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        brightnessctl.enable = lib.mkEnableOption "enables brightnessctl";
    };

    config = lib.mkIf config.brightnessctl.enable {
        home.packages = [ pkgs.brightnessctl ];
	};		
}