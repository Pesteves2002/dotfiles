{pkgs, ...}: {
  programs.wlogout = {
    enable = true;

    # Fix logout on SDDM
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
      * {
         background-image: none;
         box-shadow: none;

         font-size: 50px;
       }

       window {
         background-color: rgba(0, 0, 0, 0);
       }

       button {
         border-radius: 0;
         border-color: black;
         color: #FFFFFF;
         background-color: #1E1E1E;
         border-style: solid;
         border-width: 1px;
         background-repeat: no-repeat;
         background-position: center;
         background-size: 25%;
       }

       button:focus, button:active, button:hover {
         background-color: #01068A;
         outline-style: none;
       }

       #lock {
           background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"), url(" ${pkgs.wlogout}/share/wlogout/icons/lock.png"));
       }

       #logout {
           background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"), url(" ${pkgs.wlogout}/share/wlogout/icons/logout.png"));
       }

       #suspend {
           background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"), url(" ${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
       }

       #hibernate {
           background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"), url(" ${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
       }

       #shutdown {
           background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"), url(" ${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
       }

       #reboot {
           background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"), url(" ${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
       }

    '';
  };
}
