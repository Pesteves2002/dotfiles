{
  description = "Nix configuration for PCs and servers.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    inherit lib;

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # overlays = import ./overlays {inherit inputs outputs;};

    formatter.${system} = pkgs.alejandra;

    nixosConfigurations = {
      novablast = lib.nixosSystem {
        modules = [./hosts/novablast ./home/tomas/tomas.nix agenix.nixosModules.default];
        specialArgs = {
          inherit inputs outputs;
        };
      };

      dragonfly = lib.nixosSystem {
        modules = [./hosts/dragonfly ./home/tomas/tomas.nix agenix.nixosModules.default];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };

    homeConfigurations = {
      "tomas@novablast" = lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/tomas/novablast];
        extraSpecialArgs = {
          inherit inputs outputs;
        };
      };

      "tomas@dragonfly" = lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/tomas/dragonfly];
        extraSpecialArgs = {
          inherit inputs outputs;
        };
      };
    };
  };
}
