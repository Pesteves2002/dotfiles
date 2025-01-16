{
  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;

      #Use GPG Keys
      withExternalGnupg = true;
    };
  };
}
