{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./matlab.nix
  ];

  programs.nixvim.plugins.lsp = {
    enable = true;

    keymaps = {
      silent = true;

      diagnostic = {
        "<C-p>" = "goto_prev";
        "<leader>e" = "open_float";
      };

      lspBuf = {
        gd = "definition";
        gr = "references";
        gt = "type_definition";
        gi = "implementation";
        K = "hover";
        rn = "rename";
      };
    };

    servers = {
      bashls = {
        enable = true;
      };

      nixd = {
        enable = true;

        settings = let
          user = config.credentials.user;
          flake = ''(builtins.getFlake "/home/${user}/.dotfiles")'';
          hostname = config.credentials.hostname;
        in {
          formatting.command = ["alejandra"];
          nixpkgs.expr = "import ${flake}.inputs.nixpkgs {}";
          options = {
            nixos.expr = "${flake}.nixosConfigurations.${hostname}.options";
            home-manager.expr = "${flake}.homeConfigurations.\"${user}@${hostname}\".options";
            nixvim.expr = "${flake}.homeConfigurations.\"${user}@${hostname}\".options.programs.nixvim.type.getSubOptions []";
          };
        };
        extraOptions = {
          offset_encoding = "utf-8";
        };
      };

      clangd = {
        enable = true;
        cmd = [
          "clangd"
          "--offset-encoding=utf-16"
        ];
      };

      tinymist = {
        enable = true;
        extraOptions = {
          offset_encoding = "utf-8";
          # exportPdf = "onType";
          # formatterMode = "typstyle";
        };
        # settings = {

        #   # Avoid conflicts
        #   exportPdf = "never";
        #   experimentalFormatterMode = "on";
        # };
      };

      digestif = {
        enable = true;
      };

      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
    };
  };

  home.packages = with pkgs; [
    alejandra
  ];
}
