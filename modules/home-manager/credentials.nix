{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.credentials = {
    hostname = mkOption {
      type = types.str;
      example = "pc1";
      description = "The hostname of this device";
    };
    user = mkOption {
      type = types.str;
      example = "tomas";
      description = "The user of this device";
    };
  };
}
