{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.desktops.niri;
  theme = config.lib.stylix.colors;
in {
  config.programs.niri.settings = lib.mkIf cfg.enable {
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    prefer-no-csd = true;

    spawn-at-startup = [
      {
        command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];
      }
    ];

    environment = {
      # xwayland-satellite
      DISPLAY = ":0";
      # vscode and other apps don't want to default to wayland but work when forced
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };

    layout = {
      focus-ring.enable = false;
      border = {
        enable = true;
        active = {
          gradient = {
            angle = 130;
            relative-to = "workspace-view";
            from = "#${theme.base0D}";
            to = "#${theme.base0E}";
          };
        };
        inactive = {
          gradient = {
            angle = 130;
            relative-to = "workspace-view";
            from = "#${theme.base0D}90";
            to = "#${theme.base0E}90";
          };
        };
      };
    };

    window-rules = [
      {
        matches = [
          {
            app-id = "^org.wezfurlong.wezterm$";
          }
        ];
        default-column-width = {};
      }
    ];
  };
}
