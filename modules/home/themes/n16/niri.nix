{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  theme-cfg = config.${namespace}.themes.n16;
  niri-cfg = config.${namespace}.desktops.niri;

  colors = config.lib.stylix.colors;
in {
  config.programs.niri.settings = lib.mkIf (theme-cfg.enable && niri-cfg.enable) {
    layout = {
      focus-ring.enable = false;
      border = {
        enable = true;
        active = {
          gradient = {
            angle = 130;
            relative-to = "workspace-view";
            from = "#${colors.base0D}";
            to = "#${colors.base0E}";
          };
        };
        inactive = {
          gradient = {
            angle = 130;
            relative-to = "workspace-view";
            from = "#${colors.base0D}90";
            to = "#${colors.base0E}90";
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
