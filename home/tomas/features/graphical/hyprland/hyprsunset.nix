{
  services.hyprsunset = {
    enable = true;
    settings = {
      sunrise = {
        calendar = "*-*-* 06:00:00";
        identity = true;
      };

      sunset = {
        calendar = "*-*-* 18:00:00";
        temperature = 4000;
      };
    };
  };
}
