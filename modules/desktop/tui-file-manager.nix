{pkgs, ...}: {
  den.aspects.tui-file-manager = {
    homeManager = {
      programs.yazi.enable = true;
    };

    provides.as_system_file_manager = let
      xdgPortalPackage = pkgs.xdg-desktop-portal-termfilechooser;
    in {
      homeManager = {
        xdg.portal = {
          extraPortals = [
            xdgPortalPackage
          ];

          config = {
            common = {
              "org.freedesktop.impl.portal.FileChooser" = ["xdg-desktop-portal-termfilechooser"];
            };
          };
        };

        xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = let
          terminal = "alacritty -T termfilechooser -e";
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
