{
  den,
  inputs,
  ...
}: let
  stylixModule = {pkgs, ...}: {
    stylix = {
      autoEnable = true;

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
in {
  den.aspects.n16-theme = {
    provides.host = den.lib.parametric {
      includes = with den.aspects; [stylix {nixos = stylixModule;}];
    };

    provides.home = den.lib.parametric {
      includes = with den.aspects; [stylix {homeManager = stylixModule;}];
    };
  };
}
