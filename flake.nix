{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = {inherit inputs;};
        modules = [
	  ./configuration.nix
	];
      };
    };
  };
}
