{lib, ...}: let
  dbUsername = "kerneloeiras";
  dbName = "kerneloeiras";
in {
  services.postgresql = {
    enable = lib.mkDefault true;
    ensureUsers = [{name = dbUsername;}];
    ensureDatabases = [dbName];
  };
}
