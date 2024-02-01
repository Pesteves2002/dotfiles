{
  description = "Nix configuration for PCs and servers.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, ... }:
    let

      myLib = (import ./lib { inherit lib; }).myLib;

      inherit (builtins) filter;
      inherit (inputs.nixpkgs) lib;
      inherit (lib) hasSuffix;
      inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;

      allModules = mkModules ./modules;

      # Imports every nix module from a directory, recursively.
      mkModules = path: filter (hasSuffix ".nix") (listFilesRecursive path);

      profiles = myLib.rakeLeaves ./profiles;

    in {
      nixosConfigurations = {
        nixos = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit profiles; };
          modules = allModules
            ++ [ ./hosts/novablast inputs.home.nixosModules.home-manager ];
        };
      };
    };
}
