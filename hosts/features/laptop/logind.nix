{
  services.logind.settings = {
    Login = {
      HandleSwitchDocked = "suspend";
      HandlePowerKey = "ignore";
    };
  };
}
