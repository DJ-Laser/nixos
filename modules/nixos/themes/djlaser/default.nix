{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.themes.djlaser;
in {
  options.${namespace}.themes.djlaser = {
    enable = lib.mkEnableOption "enables default theme via stylix";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      image = ../../wallpapers/rm-rf.jpg;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";

      cursor.package = pkgs.capitaine-cursors;
      cursor.name = "capitaine-cursors";

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
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
}
