{
  imports = [
    ../common.nix

    ../features/shell

    ../features/tools
  ];

  credentials = {
    hostname = "takumi";
    user = "tomas";
  };

  home.stateVersion = "24.11";
}
