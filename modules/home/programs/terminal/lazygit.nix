{ inputs, lib, config, pkgs, ...}: 
let 
    program = "lazygit";
in {    
    options = {
        ${program}.enable = lib.mkEnableOption "enables ${program}";
    };

    config = lib.mkIf config.${program}.enable {
        programs.${program} = {
            enable = true;
            enableFishIntegration = lib.mkIf config.fish.enable true;
        };
	};		
}
