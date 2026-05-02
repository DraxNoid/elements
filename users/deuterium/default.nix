{ ... }:
{
  home-manager.users.deuterium = {
    imports = [
      ./home.nix
    ];
  };
}