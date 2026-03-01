{den, ...}: {
  den.aspects.n16-theme.provides.home.includes = with den.aspects; [
    swww._.stylixWallapaperOnActivate
  ];

  den.aspects.n16-theme.provides.home.homeManager = {config, ...}: let
    colors = config.lib.stylix.colors;
  in {
    services.mako = {
      settings = {
        border-size = 2;
        anchor = "bottom-right";
      };
    };

    stylix.targets.btop.enable = false;
    programs.btop = {
      enable = true;
      settings = {
        # Use stylix tty colors instead of the stylix custom theme
        color_theme = "TTY";
        theme_background = true;
        truecolor = true;
      };
    };

    programs.niri.settings = {
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
    };
  };
}
