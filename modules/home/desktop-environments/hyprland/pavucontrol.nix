{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        pavucontrol.enable = lib.mkEnableOption "enables pavucontrol";
    };

    config = lib.mkIf config.pavucontrol.enable {
        home.packages = [ pkgs.pavucontrol ];
	};		
}