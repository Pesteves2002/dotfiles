{pkgs, ...}: {
  programs.nixvim.plugins.lsp.servers = {
    rust_analyzer = {
      enable = true;
      package = pkgs.unstable.rust-analyzer;

      installCargo = false;
      installRustc = false;
      installRustfmt = false;

      settings = {
        cargo = {
          features = "all";
        };

        check = {
          command = "clippy";
        };

        procMacro = {
          ignored = {
            leptos_macro = [
              # component
              "server"
            ];
          };
        };
      };
    };

    # TOML LSP
    taplo = {
      enable = true;
    };
  };
}
