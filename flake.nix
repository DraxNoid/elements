{
	inputs = {
		nixpkgs.follows = "clan-core/nixpkgs";
		clan-core = {
			url = "https://git.clan.lol/clan/clan-core/archive/25.11.tar.gz";
		};
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "github:hyprwm/Hyprland";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    catppuccin.url = "github:catppuccin/nix";
		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake/beta";
			inputs ={
				nixpkgs.follows = "nixpkgs";
				home-manager.follows = "home-manager";
			};
    };
	};

  outputs =
    {
      self,
      clan-core,
      nixpkgs,
      ...
    }@inputs:
    let
      # Usage see: https://docs.clan.lol
      clan = clan-core.lib.clan {
        inherit self;
        imports = [ ./clan.nix ];
        specialArgs = { inherit inputs; };

        pkgsForSystem = system: import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      inherit (clan.config) nixosConfigurations nixosModules clanInternals;
      clan = clan.config;
      # Add the Clan cli tool to the dev shell.
      # Use "nix develop" to enter the dev shell.
      devShells =
        nixpkgs.lib.genAttrs
          [
            "x86_64-linux"
            "aarch64-linux"
            "aarch64-darwin"
            "x86_64-darwin"
          ]
          (system: {
            default = clan-core.inputs.nixpkgs.legacyPackages.${system}.mkShell {
              packages = [ clan-core.packages.${system}.clan-cli ];
            };
          });
    };
}
