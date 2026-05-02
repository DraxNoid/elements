{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        orca-slicer.enable = lib.mkEnableOption "enables orca-slicer";
    };

    config = lib.mkIf config.orca-slicer.enable {
        home.packages = [ pkgs.orca-slicer ];
	};		
}
