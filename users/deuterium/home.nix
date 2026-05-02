{ pkgs, ... }: {
  imports = [
    ../../modules/home
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
