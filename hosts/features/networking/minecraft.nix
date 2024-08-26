{
  services.minecraft-server = {
    enable = true;
    eula = true;

    declarative = true;

    serverProperties = {
      gamemode = "survival";
      difficulty = "medium";
      simulation-distance = 10;
      level-seed = "0";
      force-gamemode = true;
      motd = "Hello!!!";
    };

    openFirewall = true;
  };
}
