{ lib, config, ...}: 

{
    options = {
        fish.enable = lib.mkEnableOption "enables fish";
    };

    config = lib.mkIf config.fish.enable {
        programs.fish = {
            enable = true;
            interactiveShellInit = lib.mkIf config.starship.enable ''
                starship init fish | direnv hook fish cre| source
            '';                
            shellAliases = {
                mnt = "cd /run/usedr/$(id -u)/gvfs"; 
            };
            functions = {
                rebuild = ''
                    function rebuild
                        if test (count $argv) -eq 0
                            echo "Usage: rebuild <profile>"
                            return 1
                        end
                        set profile $argv[1]
                        sudo nixos-rebuild switch --impure --flake ~/.nixos#$profile
                    end
                '';
                flake-update = ''
                    function flake-update
                        if test (count $argv) -eq 0
                            echo "Usage: flake-update <profile>"
                            return 1
                        end
                        set profile $argv[1]
                        nix flake update --flake ~/.nixos
                        rebuild $profile
                    end
                '';
            };
        };
	};		
}