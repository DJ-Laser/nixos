{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) types mkEnableOption mkOption mkIf;
  cfg = config.${namespace}.desktops.components.hypridle;
in {
  options.${namespace}.desktops.components.hypridle = {
    enable = mkEnableOption "enables hypridle";
    package = mkOption {
      type = types.package;
      default = pkgs.hypridle;
    };

    screenLocker = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
  };

  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      package = cfg.package;

      settings = {
        general = {
          lock_cmd = mkIf (cfg.screenLocker != null) cfg.screenLocker;
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
