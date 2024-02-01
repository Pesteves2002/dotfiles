{
  description = "Nix configuration for PCs and servers.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, self, ... }: {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          inputs.home.nixosModules.home-manager
        ];
      };
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };
}
