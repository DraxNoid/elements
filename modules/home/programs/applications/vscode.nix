{ inputs, lib, config, pkgs, ...}: 

{    
    options = {
        vscode.enable = lib.mkEnableOption "enables vscode";
    };

    config = lib.mkIf config.vscode.enable {
        programs.vscode = {
            enable = true;
            profiles = {
                default = {
                    userSettings = {
                        "git.confirmSync" = false;
                        "editor.formatOnSave" = true;
                        "files.autoSave" = "afterDelay";
                        "files.autoSaveDelay" = 1000;
                        "editor.tabSize" = 4;
                        "editor.detectIndentation" = false;
                        "explorer.confirmDelete" = false;
                    };
                };
            };
        };
	};		
}
