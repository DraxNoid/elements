{ lib, ... } :{
  imports = [
    ./hyprland
  ];

  hyprland-de.enable = lib.mkDefault true;
}