{
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "auto";
      configurationLimit = 5;
    };

    efi.canTouchEfiVariables = true;
    timeout = 3;
  };
}
