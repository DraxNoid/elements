{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        clipse.enable = lib.mkEnableOption "enables clipse";
    };

    config = lib.mkIf config.clipse.enable {
	    services.clipse.enable = true;
        home.packages = [ pkgs.wl-clipboard ];
	};		
}