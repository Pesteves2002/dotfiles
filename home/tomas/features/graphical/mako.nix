{lib, ...}: {
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-right";

      background-color = lib.mkDefault "#000000";
      border-color = lib.mkDefault "#22A7F0";
      border-radius = 5;
      border-size = 2;

      default-timeout = 5000; # 5 seconds

      font = lib.mkDefault "Fira Code";
    };
  };
}
