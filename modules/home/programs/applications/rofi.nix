{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        rofi.enable = lib.mkEnableOption "enables rofi";
    };

    config = lib.mkIf config.rofi.enable {
        home.packages = [ pkgs.rofi ];
	};		
}
