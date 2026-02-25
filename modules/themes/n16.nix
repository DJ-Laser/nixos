{
  flake.modules.nixos.n16-theme = {
    pkgs,
    config,
    ...
  }: {
    stylix = {
      enable = true;
      image = ./wallpapers/colorful-planets.jpg;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";

      cursor.package = pkgs.capitaine-cursors;
      cursor.name = "capitaine-cursors";
      cursor.size = 32;

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMonoNL Nerd Font Mono";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };
      };
    };
  };

  flake.modules.homeManager.n16-theme = {config, ...}: let
    colors = config.lib.stylix.colors;
  in {
    services.mako = {
      settings = {
        border-size = 2;
        anchor = "bottom-right";
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
