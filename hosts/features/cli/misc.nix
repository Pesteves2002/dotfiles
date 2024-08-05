{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zip
    unzip
    htop
    curl
    wget
  ];
}
