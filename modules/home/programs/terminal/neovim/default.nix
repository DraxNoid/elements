{ inputs, lib, config, pkgs, ...}: 
let 
    package = "neovim";
    configPath = "${config.home.homeDirectory}/.nixos/home/programs/terminal/neovim/config";
in {    
    options = {
        ${package}.enable = lib.mkEnableOption "enables ${package}";
    };

    config = lib.mkIf config.${package}.enable {
        home.packages = [ pkgs.${package} ];
        home.file = {
            ".config/nvim" = {
                source = config.lib.file.mkOutOfStoreSymlink "${configPath}";
            };
        };
	};		
}
