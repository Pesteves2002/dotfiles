{
  config,
  inputs,
  secrets,
  lib,
  ...
}: let
  dbUsername = "kerneloeiras";
  dbName = "kerneloeiras";
in {
  age.secrets.resultsBot.file = "${secrets}/takumi/resultsBot.age";

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

  systemd.services.results-bot = {
    environment = {
      DATABASE_URL = "postgresql:///${dbName}?host=/run/postgresql";
    };

    description = "Results Discord bot";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = "kerneloeiras";
      DynamicUser = true;
      ExecStart = "${inputs.results-bot.packages.x86_64-linux.default}/bin/lisboa";
      Restart = "on-failure";
      EnvironmentFile = [
        # DISCORD_TOKEN
        config.age.secrets.resultsBot.path
      ];

      # systemd hardening
      NoNewPrivileges = true;
      SystemCallArchitectures = "native";
      # RestrictAddressFamilies = [
      #   "AF_INET"
      #   "AF_INET6"
      # ];
      RestrictNamespaces = !config.boot.isContainer;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      ProtectControlGroups = !config.boot.isContainer;
      ProtectHostname = true;
      ProtectKernelLogs = !config.boot.isContainer;
      ProtectKernelModules = !config.boot.isContainer;
      ProtectKernelTunables = !config.boot.isContainer;
      LockPersonality = true;
      PrivateTmp = !config.boot.isContainer;
      PrivateDevices = true;
      PrivateUsers = true;
      RemoveIPC = true;

      SystemCallFilter = [
        "~@clock"
        "~@aio"
        "~@chown"
        "~@cpu-emulation"
        "~@debug"
        "~@keyring"
        "~@memlock"
        "~@module"
        "~@mount"
        "~@obsolete"
        "~@privileged"
        "~@raw-io"
        "~@reboot"
        "~@setuid"
        "~@swap"
      ];
      SystemCallErrorNumber = "EPERM";
    };
  };
}
