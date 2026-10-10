{
  den,
  inputs,
  ...
}: let
  themeModule = {pkgs, ...}: {
    stylix = {
      autoEnable = true;

      image = ../../wallpapers/colorful-planets.jpg;
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
in {
  den.default.includes = [den.aspects.theming];

  den.aspects.theming = {
    os = {
      host,
      lib,
      ...
    }: {
      imports = [
        inputs.stylix.nixosModules.stylix
        themeModule
      ];

      stylix = {
        enable = true;
        autoEnable = lib.mkDefault false;
        homeManagerIntegration = {
          autoImport = true;
          followSystem = true;
        };
      };
    };

    homeManager = {
      home,
      lib,
      ...
    }: {
      imports = [
        inputs.stylix.homeModules.stylix
        themeModule
      ];

      stylix = {
        enable = true;
        autoEnable = lib.mkDefault false;
      };
    };
  };
}
