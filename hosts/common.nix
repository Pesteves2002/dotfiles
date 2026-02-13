{
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      ./features/cli
      ./features/locale/pt-pt.nix
      ./features/networking
      ./features/security
      ./features/system
      ./features/infra/prometheus.nix
      ./features/infra/loki.nix
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
