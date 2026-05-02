{ inputs, lib, config, pkgs, ...}: 
let 
    package = "webcord";
in {    
    options = {
        ${package}.enable = lib.mkEnableOption "enables ${package}";
    };

    config = lib.mkIf config.${package}.enable {
        home.packages = [ pkgs.${package} ];
	};		
}
