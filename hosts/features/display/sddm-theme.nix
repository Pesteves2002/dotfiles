{pkgs}: let
  imgLink = "https://raw.githubusercontent.com/Pesteves2002/dotfiles/nixos/home/tomas/features/config/wallpapers/planet.png";

  image = pkgs.fetchurl {
    url = imgLink;
    hash = "sha256-oJhnAg9gGc8BPl57NHfdGSwTx9h57RSpX9CVj1Hc15o=";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-sugar-dark";
      rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
      sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      cd $out/
      rm Background.jpg
      cp -r ${image} $out/Background.jpg
    '';
  }
