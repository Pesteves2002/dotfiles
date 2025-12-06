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
      ./features/networking/resolved.nix
    ]
    ++ builtins.attrValues outputs.nixosModules
    ++ [inputs.agenix.nixosModules.default];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };
}
