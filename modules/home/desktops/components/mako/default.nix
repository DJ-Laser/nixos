{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) types mkEnableOption mkOption mkIf;
  cfg = config.${namespace}.desktops.components.mako;
  niriCfg = config.${namespace}.desktops.niri;
in {
  options.${namespace}.desktops.components.mako = {
    enable = mkEnableOption "enables swww wallpaper engine";
    package = mkOption {
      type = types.package;
      default = pkgs.mako;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];

    services.mako = mkIf niriCfg.enable {
      enable = true;
      package = cfg.package;
    };
  };
}
