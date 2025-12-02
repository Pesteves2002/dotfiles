{
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      ./features/shell
      ./features/tools
    ]
    ++ [inputs.nixvim.homeModules.nixvim]
    ++ [inputs.stylix.homeModules.stylix]
    ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = "tomas";
    homeDirectory = "/home/tomas";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
