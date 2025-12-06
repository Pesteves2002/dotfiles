{lib, ...}: {
  imports = [
    ./resolved.nix
  ];

  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = lib.mkDefault "client";
  };
}
