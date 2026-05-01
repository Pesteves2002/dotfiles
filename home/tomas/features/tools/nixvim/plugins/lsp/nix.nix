{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nixvim.plugins.lsp.servers.nixd = {
    enable = true;

    settings = let
      inherit (config.credentials) user hostname;
      flake = ''(builtins.getFlake "/home/tomas/.dotfiles")'';
    in {
      formatting.command = ["alejandra"];

      nixpkgs.expr =
        if pkgs.stdenv.hostPlatform.isLinux
        then "import ${flake}.inputs.nixpkgs { }"
        else "";

      options = lib.mkIf pkgs.stdenv.isLinux {
        nixos.expr = "${flake}.nixosConfigurations.${hostname}.options";
        home-manager.expr = "${flake}.homeConfigurations.\"${user}@${hostname}\".options";
        nixvim.expr = "${flake}.homeConfigurations.\"${user}@${hostname}\".options.programs.nixvim.type.getSubOptions []";
      };
    };
  };

  home.packages = with pkgs; [
    alejandra
  ];
}
