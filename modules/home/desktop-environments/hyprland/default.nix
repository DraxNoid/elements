{ pkgs, lib, config, ...}: {
  imports = [
    ./hyprland.nix
    ./waybar
    ./hyprpaper.nix
    ./hyprlock.nix
    ./brightnessctl.nix
    ./pavucontrol.nix
    ./hyprshot.nix
    ./clipse.nix
    ./mako.nix
  ];
  options = {
    hyprland-de.enable = lib.mkEnableOption "enables hyprland-de";
  };

  config = lib.mkIf config.hyprland-de.enable {
    hyprland.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
    hyprpaper.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    brightnessctl.enable = lib.mkDefault true;
    pavucontrol.enable = lib.mkDefault true;
    hyprshot.enable = lib.mkDefault true;
    clipse.enable = lib.mkDefault true;
    mako.enable = lib.mkDefault true;
  };
}