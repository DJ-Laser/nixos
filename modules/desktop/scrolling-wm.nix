{
  den,
  inputs,
  ...
}: {
  den.aspects.scrolling-wm = {
    includes = with den.aspects; [
      desktop-wallpaper
      notification-display
      n16-shell
      idle-management
      lock-screen
    ];

    nixos = {
      environment.pathsToLink = ["/share/xdg-desktop-portal"];
    };

    homeManager = {
      config,
      lib,
      pkgs,
      options,
      ...
    }: {
      imports = [
        inputs.niri.homeModules.niri
      ];

      home.packages = [pkgs.xwayland-satellite];
      programs.niri.enable = true;

      programs.niri.settings = let
        colors = config.lib.stylix.colors;
      in {
        prefer-no-csd = true;
        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        binds = import ./_niri-binds {
          inherit lib pkgs;
          actions = config.lib.niri.actions;
          screenLocker = "hyprlock";
        };

        switch-events.lid-close.action.spawn = "hyprlock";

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
            matches = [{app-id = "termfilechooser";}];
            open-floating = true;
            open-focused = true;
          }
        ];
      };

      home.sessionVariables = {
        # Vscode and other apps don't want to default to wayland but work when forced
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      };
    };
  };
}
