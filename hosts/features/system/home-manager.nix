{
  inputs,
  outputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  home-manager.users.tomas = import ../../../home/tomas/${config.networking.hostName}; # FIXME
}
