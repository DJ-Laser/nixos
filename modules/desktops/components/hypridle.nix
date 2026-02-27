{
  den.aspects.hypridle = {
    homeManager.services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "hyprlock";
          before_sleep_cmd = "loginctl lock-session";
        };

        listener = [
          {
            timeout = 150; # 2.5min.
            on-timeout = "brightnessctl -s set 10"; # Dim monitor
            on-resume = "brightnessctl -r"; # Restore monitor brightness
          }

          {
            timeout = 300; # 5min.
            on-timeout = "loginctl lock-session";
          }

          #{
          #  timeout = 1200; # 20 min
          #  on-timeout = "systemd suspend";
          #}
        ];
      };
    };
  };
}
