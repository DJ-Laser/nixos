{den, ...}: {
  den.aspects.tui-file-manager = {
    homeManager = {
      programs.yazi.enable = true;
    };

    as_system_file_manager = {
      includes = [
        den.aspects.tui-file-manager
      ];

      homeManager = {pkgs, ...}: let
        xdgPortalPackage = pkgs.xdg-desktop-portal-termfilechooser;
      in {
        xdg.portal = {
          extraPortals = [
            xdgPortalPackage
          ];

          config.common = {
            "org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
          };
        };

        xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = let
          terminal = "alacritty --class termfilechooser -e";
          script = "${xdgPortalPackage}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh";
        in ''
          [filechooser]
          cmd=${script}
          env=TERMCMD='${terminal}'
        '';
      };
    };
  };
}
