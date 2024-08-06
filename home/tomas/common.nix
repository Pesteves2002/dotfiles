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
    ++ [inputs.nixvim.homeManagerModules.nixvim]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "tomas";
    homeDirectory = "/home/tomas";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
