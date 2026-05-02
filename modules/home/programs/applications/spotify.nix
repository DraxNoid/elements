{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        spotify.enable = lib.mkEnableOption "enables spotify";
    };

    config = lib.mkIf config.spotify.enable {
        home.packages = [ pkgs.spotify ];
	};		
}
