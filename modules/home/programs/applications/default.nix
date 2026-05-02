{ lib, config, options, ... }:
{
  imports = [
    ./zen-browser.nix
    ./vscode.nix
    ./rofi.nix
    ./spotify.nix
    ./orca-slicer.nix
    ./webcord.nix
    ./jellyfin.nix
  ];

  config = {
    zen-browser.enable = lib.mkDefault true;
    vscode.enable = lib.mkDefault true;
    rofi.enable = lib.mkDefault true;
    hyprshot.enable = lib.mkDefault true;
    spotify.enable = lib.mkDefault false;
    orca-slicer.enable = lib.mkDefault true;
    webcord.enable = lib.mkDefault true;
    jellyfin.enable = lib.mkDefault true;

    shared.browser = if config.zen-browser.enable then "zen"
      else "";
  };
}
