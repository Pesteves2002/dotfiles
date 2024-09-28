{outputs, ...}: {
  imports =
    [
      ./features/cli
      ./features/locale/pt-pt.nix
      ./features/system
      ./features/security
    ]
    ++ builtins.attrValues outputs.nixosModules;

  nixpkgs = {
    # overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}
