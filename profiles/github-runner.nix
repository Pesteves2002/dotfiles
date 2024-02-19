{...}: {
  services.github-runners = {
    runner1 = {
      enable = true;
      name = "cpd-runner";
      tokenFile = "/home/tomas/Documents/CPD/runner.token";
      url = "https://github.com/Pesteves2002/game-of-life-3d-cpd";
    };
  };
}
