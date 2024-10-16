{lib, ...}: {
  services.mako = {
    enable = true;

    anchor = "top-right";

    backgroundColor = lib.mkDefault "#000000";
    borderColor = lib.mkDefault "#22A7F0";
    borderRadius = 5;
    borderSize = 2;

    defaultTimeout = 5000; # 5 seconds

    font = lib.mkDefault "Fira Code";
  };
}
