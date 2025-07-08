{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.btop;
in {
  options.${namespace}.apps.btop = {
    enable = lib.mkEnableOption "Whether to enable btop";
  };

  config = lib.mkIf cfg.enable {
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
  };
}
