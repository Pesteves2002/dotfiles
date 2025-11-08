{pkgs, ...}: {
  programs.nixvim.plugins.lsp.servers.rust_analyzer = {
    enable = true;

    installCargo = false;
    installRustc = false;
    installRustfmt = false;

    settings = {
      check = {
        command = "clippy";
      };
    };
  };

  home.packages = with pkgs; [
    clippy
  ];
}
