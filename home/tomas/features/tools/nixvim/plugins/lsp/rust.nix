{pkgs, ...}: {
  programs.nixvim.plugins.lsp.servers.rust_analyzer = {
    enable = true;

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

  home.packages = with pkgs; [
    clippy
  ];
}
