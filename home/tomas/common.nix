{
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      ./features/shell
      ./features/tools
      ./stylix.nix
    ]
    ++ [inputs.nixvim.homeManagerModules.nixvim]
    ++ [inputs.stylix.homeManagerModules.stylix]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-29.4.6"
      ];
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
