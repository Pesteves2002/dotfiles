{
  pkgs,
  config,
  ...
}: {
  programs.nixvim.plugins.lsp.servers.nixd = {
    enable = true;

    settings = let
      user = config.credentials.user;
      flake = ''(builtins.getFlake "/home/${user}/.dotfiles")'';
      hostname = config.credentials.hostname;
    in {
      formatting.command = ["alejandra"];

      nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";

      options = {
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
