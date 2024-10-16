{lib, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      allow_markup = true;
      insensitive = true;
      gtk_dark = true;
    };

    style = lib.mkDefault ''
      window {
      margin: 0px;
      background-color: #2e3440;
      }

      #input {
      margin: 5px;
      border: none;
      color: #d8dee9;
      background-color: #3b4252;
      }

      #inner-box {
      margin: 5px;
      border: none;
      background-color: #2e3440;
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #2e3440;
      }

      #scroll {
      margin: 0px;
      border: none;
      }

      #text {
      margin: 5px;
      border: none;
      color: #d8dee9;
      }

      #entry:selected {
      background-color: #3b4252;
      }
    '';
  };
}
