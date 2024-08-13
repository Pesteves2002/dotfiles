{
  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      EncryptedMediaExtensions = {
        Enabled = true;
        Locked = true;
      };
      DisableTelemetry = true;
      PasswordManagerEnabled = false;

      UserMessaging = {
        # WhatsNew = false;
        ExtensionRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = false;
        MoreFromMozilla = false;
      };
      FirefoxHome = {
        # Search = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        SponsoredTopSites = false;
      };

      OfferToSaveLogins = false;
      # SearchSuggestEnabled = false;

      ShowHomeButton = false;
      Homepage = {
        URL = "about:blank";
        StartPage = "none";
      };
    };
  };
}
