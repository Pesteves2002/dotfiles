{
  description = "Nix configuration for PCs and servers.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix/release-25.05";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    simple-nixos-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-25.05";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;

    system = "x86_64-linux";

    overlays = [
      (
        final: prev: {
          unstable = import inputs.unstable {
            system = prev.system;
            config.allowUnfree = true;
          };
        }
      )
    ];

    pkgs =
      import inputs.nixpkgs
      {
        inherit system overlays;
        config.allowUnfree = true;
      };

    secrets = ./secrets;
  in {
    inherit lib;

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # overlays = import ./overlays {inherit inputs outputs;};

    formatter.${system} = pkgs.alejandra;

    nixosConfigurations = {
      novablast = lib.nixosSystem {
        inherit pkgs;
        modules = [./hosts/novablast];
        specialArgs = {
          inherit
            inputs
            outputs
            secrets
            ;
        };
      };

      dragonfly = lib.nixosSystem {
        inherit pkgs;
        modules = [./hosts/dragonfly];
        specialArgs = {
          inherit inputs outputs secrets;
        };
      };

      takumi = lib.nixosSystem {
        inherit pkgs;
        modules = [./hosts/takumi];
        specialArgs = {
          inherit inputs outputs secrets;
        };
      };
    };

    homeConfigurations = {
      inherit pkgs;
      "tomas@novablast" = lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/tomas/novablast];
        extraSpecialArgs = {inherit inputs outputs overlays;};
      };

      "tomas@dragonfly" = lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/tomas/dragonfly];
        extraSpecialArgs = {inherit inputs outputs overlays;};
      };

      "tomas@takumi" = lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/tomas/takumi];
        extraSpecialArgs = {inherit inputs outputs overlays;};
      };
    };
  };
}
