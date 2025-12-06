{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    # useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
