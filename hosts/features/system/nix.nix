{inputs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # Optimise common packages
    optimise = {
      automatic = true;
      dates = ["02:00"];
    };

    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
