{
  imports = [
    ../common.nix
  ];

  credentials = {
    hostname = "takumi";
    user = "tomas";
  };

  home.stateVersion = "24.11";
}
