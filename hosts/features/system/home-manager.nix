{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.backupFileExtension = "backup";

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };
}
