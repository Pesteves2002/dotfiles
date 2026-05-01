{
  imports = [
./spotlight.nix

    ../common.nix

    ../features/graphical/aerospace.nix
	   ../features/shell
	   ../features/tools
  ];

  # monitors = [
  #   {
  #     name = "eDP-1";
  #     width = 1920;
  #     height = 1080;
  #     refreshRate = 60;
  #     x = 0;
  #     y = 0;
  #     primary = true;
  #     workspace = "1";
  #   }
  # ];

  # credentials = {
  #   # hostname = "dragonfly";
  #   user = "tomas";
  # };

  # laptop.isLaptop = true;

  home.stateVersion = "24.11";
}
