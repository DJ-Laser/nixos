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
  stylixCfg = config.stylix.targets.btop;
in {
  options.${namespace}.apps.btop = {
    enable = lib.mkEnableOption "Whether to enable btop";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        # Use tty colors unless stylix is enabled
        color_theme = lib.mkIf (!stylixCfg.enable) "TTY";
        theme_background = true;
        truecolor = true;
      };
    };
  };
}
