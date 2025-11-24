let
  hosts = {
    novablast = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKeYkRVRMSHyie1M8aP5aovDUOVy/QooT19wT3fFLLRo";
    dragonfly = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0r4o+OjJ18Ue3L0KfNh7dyMQ+MsFLWAraBuUhH0mDM";
    takumi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILpTsXdsGEwZhLoHMs3aP2BrYC5ouqzElCkDaPR56Tbx";
  };
in {
  "novablast/a.age".publicKeys = [
    hosts.novablast
  ];

  "takumi/nextcloud.age".publicKeys = [
    hosts.takumi
  ];

  "takumi/mailTomas.age".publicKeys = [
    hosts.takumi
  ];

  "takumi/resultsBot.age".publicKeys = [
    hosts.takumi
  ];
}
