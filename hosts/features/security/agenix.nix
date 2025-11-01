{inputs, ...}: {
  environment.systemPackages = [
    inputs.agenix.packages.x86_64-linux.default
  ];

  age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
}
