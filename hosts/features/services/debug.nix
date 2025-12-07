{lib, ...}: let
  dbUsername = "kerneloeiras";
  dbName = "kerneloeiras";
in {
  services.postgresql = {
    enable = lib.mkDefault true;
    ensureUsers = [
      {
        name = dbUsername;
        ensureDBOwnership = true;
      }
    ];
    ensureDatabases = [dbName];

    authentication = ''
      #type database  DBuser  auth-method
      local all      all     trust
    '';

    identMap = ''
      # ArbitraryMapName systemUser DBUser
         superuser_map      root      postgres
         superuser_map      postgres  postgres
         # Let other names login as themselves
         superuser_map      /^(.*)$   \1
    '';
  };

  users = {
    users.kerneloeiras = {
      isSystemUser = true;
      group = "kerneloeiras";
    };

    groups = {
      kerneloeiras = {};
    };
  };
}
