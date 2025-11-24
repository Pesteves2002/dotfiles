{
  config,
  inputs,
  secrets,
  ...
}: {
  age.secrets.resultsBot.file = "${secrets}/takumi/resultsBot.age";

  systemd.services.results-bot = {
    description = "Results Discord bot";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      DynamicUser = true;
      ExecStart = "${inputs.results-bot.packages.x86_64-linux.default}/bin/lisboa";
      Restart = "on-failure";
      EnvironmentFile = [config.age.secrets.resultsBot.path];

      # systemd hardening
      NoNewPrivileges = true;
      SystemCallArchitectures = "native";
      RestrictAddressFamilies = [
        "AF_INET"
        "AF_INET6"
      ];
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
