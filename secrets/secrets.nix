let
  hosts = {
    novablast = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKeYkRVRMSHyie1M8aP5aovDUOVy/QooT19wT3fFLLRo";
    dragonfly = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0r4o+OjJ18Ue3L0KfNh7dyMQ+MsFLWAraBuUhH0mDM";
  };
in {
  "novablast/a.age".publicKeys = [
    hosts.novablast
  ];
}
