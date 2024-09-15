{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  makeWrapper,
  gitUpdater,
  electron_30,
  imagemagick,
}: let
  electron = electron_30;
in
  buildNpmPackage rec {
    pname = "gfn-electron";
    version = "2.1.2";

    src = fetchFromGitHub {
      owner = "hmlendea";
      repo = "gfn-electron";
      rev = "v${version}";
      hash = "sha256-kTnM4wSDqP2V8hb4mDhbQYpVYouSnUkjuuCfITb/xgY=";
    };

    npmDepsHash = "sha256-27N0hWOfkLQGaGspm4aCoVF6PWiUOAKs+JzbdQV94lo=";
    makeCacheWritable = true;
    forceGitDeps = true;

    npmFlags = ["--ignore-scripts"];

    dontBuild = true;

    nativeBuildInputs = [imagemagick];

    buildInputs = [electron];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/gfn-electron
      cp -r . $out/share/gfn-electron

      mkdir $out/share/applications
      mv com.github.hmlendea.geforcenow-electron.desktop $out/share/applications/
      substituteInPlace \
          $out/share/applications/com.github.hmlendea.geforcenow-electron.desktop \
          --replace 'Exec=/opt/geforcenow-electron/geforcenow-electron' 'Exec=${pname}'

      # Generate and install icon files
      for size in 16 32 48 64 72 96 128 192 512 1024; do
        mkdir -p $out/share/icons/hicolor/"$size"x"$size"/apps
        convert icon.png -sample "$size"x"$size" \
          -background white -gravity south -extent "$size"x"$size" \
          $out/share/icons/hicolor/"$size"x"$size"/apps/nvidia.png
      done

      makeWrapper '${electron}/bin/electron' "$out/bin/gfn-electron" \
        --inherit-argv0 \
        --add-flags "$out/share/gfn-electron" \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=auto}}"

      runHook postInstall
    '';

    passthru.updateScript = gitUpdater {
      rev-prefix = "v";
    };

    meta = with lib; {
      homepage = "https://github.com/hmlendea/gfn-electron";
      description = "Unofficial Linux Desktop client for Nvidia's GeForce NOW game streaming service";
      license = licenses.gpl3Only;
      platforms = platforms.linux;
      maintainers = with maintainers; [dsuetin];
      mainProgram = "gfn-electron";
    };
  }
