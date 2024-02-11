{
  description = "Nix configuration for PCs and servers.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ {...}: let
    myLib = (import ./lib {inherit lib;}).myLib;

    inherit (builtins) filter;
    inherit (inputs.nixpkgs) lib;
    inherit (lib) hasSuffix;
    inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;

    system = "x86_64-linux";

    allModules = mkModules ./modules;

    # Imports every nix module from a directory, recursively.
    mkModules = path: filter (hasSuffix ".nix") (listFilesRecursive path);

    profiles = myLib.rakeLeaves ./profiles;

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      tomas = inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {inherit profiles inputs;};
        modules =
          allModules
          ++ [
            ./hosts/novablast
            inputs.home.nixosModules.home-manager
            {home-manager = {useGlobalPkgs = true;};}
          ];
      };
    };

    # Use Alejandra to format .nix files
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
