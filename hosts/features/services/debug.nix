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
      local sameuser  all     peer        map=superuser_map
    '';

    identMap = ''
      # ArbitraryMapName systemUser DBUser
         superuser_map      root      postgres
         superuser_map      postgres  postgres
         superuser_map      tomas       kerneloeiras
         # Let other names login as themselves
         superuser_map      /^(.*)$   \1
    '';
  };

  users = {
    users.${dbName} = {
      isSystemUser = true;
      group = "${dbName}";
    };

    groups = {
      ${dbName} = {};
    };
  };
}
