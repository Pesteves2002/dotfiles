{
  services.hyprsunset = {
    enable = true;
    transitions = {
      sunrise = {
        calendar = "*-*-* 06:00:00";
        requests = [
          ["identity" "true"]
        ];
      };

      sunset = {
        calendar = "*-*-* 18:00:00";
        requests = [
          ["temperature" "4000"]
        ];
      };
    };
  };
}
