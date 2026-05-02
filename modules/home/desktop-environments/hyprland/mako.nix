{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        mako.enable = lib.mkEnableOption "enables mako";
    };

    config = lib.mkIf config.mako.enable {
       	services.mako = {
            enable = true;
            settings = {
                "default-timeout" = 3000;
            };
        };
	};		
}