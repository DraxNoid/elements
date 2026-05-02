{ lib, config, pkgs, ... }:

{
  options = {
    zellij.enable = lib.mkEnableOption "enables zellij";
  };

  config = lib.mkIf config.zellij.enable {
    programs.zellij = {
      enable = true;
      # Provide additional configuration as needed
      # configFile = "${config.home.homeDirectory}/.config/zellij/config.kdl";
    };

    home.packages = with pkgs; [ zellij ];
  };
}
