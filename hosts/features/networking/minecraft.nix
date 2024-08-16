{
  services.minecraft-server = {
    enable = true;
    eula = true;

    declarative = true;

    serverProperties = {
      gamemode = "creative";
      difficulty = "easy";
      simulation-distance = 10;
      level-seed = "4";
    };
  };

  networking.firewall = {
    allowedTCPPorts = [25565];
    allowedUDPPorts = [25565];
  };
}
