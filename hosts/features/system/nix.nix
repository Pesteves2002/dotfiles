{inputs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    # Garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };

    # Optimise common packages
    optimise = {
      automatic = true;
      dates = ["02:00"];
    };

    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
