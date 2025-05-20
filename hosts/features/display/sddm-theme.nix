{pkgs}: let
  imgLink = "https://raw.githubusercontent.com/Pesteves2002/dotfiles/nixos/home/tomas/features/config/wallpapers/beach.png";

  image = pkgs.fetchurl {
    url = imgLink;
    hash = "sha256-oJhnAg9gGc8BPl57NHfdGSwTx9h57RSpX9CVj1Hc15o=";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-astronaut-theme";
      rev = "bf4d01732084be29cedefe9815731700da865956";
      sha256 = "";
    };

    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      cd $out/
      rm Background.jpg
      cp -r ${image} $out/Background.jpg
    '';
  }
