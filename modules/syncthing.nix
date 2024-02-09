{config, ...}: {
  services.syncthing = {
    enable = true;
    user = "tomas";
    # TODO: Remove hardcoded
    dataDir = "/home/tomas/.syncthing";
    settings = {gui = {theme = "dark";};};
  };
}
