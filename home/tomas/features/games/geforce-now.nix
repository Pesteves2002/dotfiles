{pkgs, ...}: {
  home.packages = [
    (pkgs.callPackage ./geforce-now-package.nix {})
  ];
}
