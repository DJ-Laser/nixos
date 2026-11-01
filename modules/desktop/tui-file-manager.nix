{den, ...}: {
  den.aspects.tui-file-manager = {
    homeManager = {
      programs.yazi.enable = true;
    };

    as_system_file_manager = {
      includes = [
        den.aspects.tui-file-manager
      ];

      homeManager = {
        pkgs,
        self',
        ...
      }: {
        programs.yazi = {
          plugins = {
            filechooser = {
              package = self'.packages.filechooser-yazi;
              setup = true;
              settings = {
                overwrite_dialog = true;
              };
            };
          };

          keymap = {
            /*
              mgr.prepend_keymap = [
              {
                on = "<Enter>";
                run = "plugin filechooser";
                desc = "Open/choose the selected files or folders, or the hovered one if non selected";
              }
              {
                on = "o";
                run = "plugin filechooser";
                desc = "Open/choose the selected files or folders, or the hovered one if non selected";
              }
            ];
            */
          };
        };

        xdg.portal = {
          extraPortals = [
            self'.packages.ttypicker
          ];

          config.common = {
            "org.freedesktop.impl.portal.FileChooser" = ["ttypicker"];
          };
        };

        xdg.configFile."ttypicker/config.toml".text = let
        in ''
          [FileChooser]
          term="alacritty --class ttypicker --title {TITLE} -e"
          exec="yazi --chooser-file={OUT_PATH} {IN_PATH}"
          in_path="{SUGGESTED_PATH}"
        '';
      };
    };
  };
}
