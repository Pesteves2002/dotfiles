{lib, ...}: {
  qt = {
    enable = true;

    # platformTheme.name = lib.mkDefault "gtk";

    style.name = lib.mkDefault "adwaita-dark";
  };
}
