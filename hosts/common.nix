{
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      ./features/cli
      ./features/locale/pt-pt.nix
      ./features/system
      ./features/security
      ./features/networking/tailscale.nix
    ]
    ++ builtins.attrValues outputs.nixosModules
    ++ [inputs.agenix.nixosModules.default];
}
