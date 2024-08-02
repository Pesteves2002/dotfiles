{
  description = "Nix configuration for PCs and servers.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {...}: let
    myLib = (import ./lib {inherit lib;}).myLib;

    inherit (builtins) listToAttrs attrNames readDir filter;
    inherit (inputs.nixpkgs) lib;
    inherit (lib) hasSuffix;
    inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;

    sshKeys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMOPNp+vhM3oHBcsCIWys8t8/pRz7q6Tlt2orblvYmPHXoQ3QhNTI9zlyLhBaF/Ol2ac6LpRJjnTGu41uq8ccso="
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPa8Z24yEquM4MZTbflPvA3LufkHgdWX62OGrjufkfzP tomas@novablast"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0r4o+OjJ18Ue3L0KfNh7dyMQ+MsFLWAraBuUhH0mDM tomas@dragonfly"
    ];

    system = "x86_64-linux";

    allModules = mkModules ./modules;

    # Imports every nix module from a directory, recursively.
    mkModules = path: filter (hasSuffix ".nix") (listFilesRecursive path);

    profiles = myLib.rakeLeaves ./profiles;

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    # Imports every host defined in a directory.
    mkHosts = dir:
      listToAttrs (map (name: {
        inherit name;
        value = inputs.nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit
              inputs
              profiles
              sshKeys
              ;
            hostName = name;
          };
          modules =
            [
              {networking.hostName = name;}
              inputs.home.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                };
              }
            ]
            ++ allModules
            ++ (mkModules "${dir}/${name}");
        };
      }) (attrNames (readDir dir)));
  in {
    nixosConfigurations = mkHosts ./hosts;

    # Use Alejandra to format .nix files
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
