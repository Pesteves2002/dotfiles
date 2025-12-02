{
  description = "Nix configuration for PCs and servers.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default-linux";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:nix-community/stylix/release-25.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    simple-nixos-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-25.11";

    tomase-website = {
      url = "github:Pesteves2002/tomase-website";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    results-bot = {
      url = "git+ssh://git@github.com/Pesteves2002/results-bot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;

    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = lib.genAttrs (import systems);

    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );

    secrets = ./secrets;
  in {
    inherit lib;

    checks = forAllSystems (
      system: let
        hooksLib = inputs.git-hooks.lib.${system};
      in {
        pre-commit-check = hooksLib.run {
          src = ./.;
          hooks = {
            alejandra.enable = true;
            deadnix.enable = true;
            statix = {
              enable = true;
              settings.ignore = [".direnv" "hardware.nix"];
            };

            shellcheck.enable = true;
            shfmt.enable = true;
          };
        };
      }
    );

    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        preCommit = self.checks.${system}.pre-commit-check;
      in {
        default = pkgs.mkShell {
          inherit (preCommit) shellHook;
          buildInputs = preCommit.enabledPackages;
        };
      }
    );

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs outputs;};

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      novablast = lib.nixosSystem {
        modules = [./hosts/novablast];
        specialArgs = {
          inherit self inputs outputs secrets;
        };
      };

      dragonfly = lib.nixosSystem {
        modules = [./hosts/dragonfly];
        specialArgs = {
          inherit self inputs outputs secrets;
        };
      };

      takumi = lib.nixosSystem {
        modules = [./hosts/takumi];
        specialArgs = {
          inherit self inputs outputs secrets;
        };
      };
    };

    homeConfigurations = {
      "tomas@novablast" = lib.homeManagerConfiguration {
        modules = [./home/tomas/novablast];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit self inputs outputs;};
      };

      "tomas@dragonfly" = lib.homeManagerConfiguration {
        modules = [./home/tomas/dragonfly];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit self inputs outputs;};
      };

      "tomas@takumi" = lib.homeManagerConfiguration {
        modules = [./home/tomas/takumi];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit self inputs outputs;};
      };
    };
  };
}
