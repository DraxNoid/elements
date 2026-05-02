{ lib, config, ...}: 

{
    options = {
        ghostty.enable = lib.mkEnableOption "enables ghostty";
    };

    config = lib.mkIf config.ghostty.enable {
      	programs.ghostty = {
            enable = true;
            enableFishIntegration = lib.mkIf config.fish.enable true;
            settings = {
                command = "fish";
            };
        };
	};		
}