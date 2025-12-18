{
  services.hyprsunset = {
    enable = true;
    settings = {
      profile = [
        {
          time = "06:00:00";
          identity = true;
        }

        {
          time = "18:00:00";
          temperature = 4000;
        }
      ];
    };
  };
}
