{ lib, config, options, ... }:
{
  imports = [
    ./common.nix
    ./ghostty.nix
    ./fish.nix
    ./starship.nix
    ./tmux.nix
    ./git.nix
    ./yazi
    ./neovim
    ./lazygit.nix
    ./zellij.nix
  ];
  
  config = {
    ghostty.enable = lib.mkDefault true;
    fish.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    yazi.enable = lib.mkDefault true;
    neovim.enable = lib.mkDefault true;
    lazygit.enable = lib.mkDefault true;
    zellij.enable = lib.mkDefault true;

    shared.terminal = lib.findFirst (term: config.${term}.enable) "" [ "ghostty" "kitty" ];
  };
}
