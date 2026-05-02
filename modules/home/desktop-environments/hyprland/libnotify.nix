{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        libnotify.enable = lib.mkEnableOption "enables libnotify";
    };

    config = lib.mkIf config.libnotify.enable {
        home.packages = [ pkgs.libnotify ];
	};		
}