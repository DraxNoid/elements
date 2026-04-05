{ self, ... }:
{
  imports = [
    self.inputs.home-manager.nixosModules.default
  ];

  home-manager.users.dueterium = {
    imports = [
      ./home.nix
    ];
  };
}