{
  services.syncthing = {
    enable = true;
    user = "tomas";
    # TODO: Remove hardcoded
    dataDir = "/home/tomas/.syncthing";

    # Do not allow Syncthing to remove folders and devices configured with the GUI
    overrideFolders = false;
    overrideDevices = false;

    settings = {gui = {theme = "dark";};};
  };
}
