{
  inputs,
  lib,
  outputs,
pkgs,
  ...
}: let 
  username = "tomas";
  homeDirectory =
if pkgs.stdenv.hostPlatform.isDarwin
    then "/Users/${username}"
    else "/home/${username}";
  in
{
  imports =
    [inputs.nixvim.homeModules.nixvim]
    ++ [inputs.stylix.homeModules.stylix]
    ++ (builtins.attrValues outputs.homeManagerModules);
  nix.gc = {
    automatic = true;

    # dates = "03:15";
    options = "--delete-older-than 30d";
  };

  nixpkgs = {
    overlays = [
      inputs.self.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  home = {
      inherit homeDirectory username;
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
