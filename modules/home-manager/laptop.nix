{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.laptop = {
    isLaptop = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether this device is a laptop";
    };
  };
}
