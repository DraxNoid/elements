{ inputs, lib, config, pkgs, ...}: 
let 
    program = "jellyfin";
in {    
    options = {
        ${program}.enable = lib.mkEnableOption "enables ${program}";
    };

    config = lib.mkIf config.${program}.enable {
        home.packages = [ pkgs.jellyfin-desktop ];
	};		
}
