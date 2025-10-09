{outputs, ...}: {
  imports =
    [
      ./features/cli
      ./features/locale/pt-pt.nix
      ./features/system
      ./features/security
    ]
    ++ builtins.attrValues outputs.nixosModules;
}
