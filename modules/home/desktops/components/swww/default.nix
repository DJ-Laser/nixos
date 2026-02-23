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
  cfg = config.${namespace}.desktops.components.swww;
in {
  options.${namespace}.desktops.components.swww = {
    enable = mkEnableOption "enables swww wallpaper engine";
    package = mkOption {
      type = types.package;
      default = pkgs.swww;
    };
  };

  config = mkIf cfg.enable {
    services.swww = {
      enable = true;
      package = cfg.package;
    };

    home.activation = {
      setWallpaper = lib.home-manager.hm.dag.entryAfter ["writeBoundary"] ''
        run ${cfg.package}/bin/swww img "${config.stylix.image}" \
          --transition-fps 60 \
          --transition-duration 2 \
          --transition-type random \
          --transition-pos top-right \
          --transition-bezier .3,0,0,.99 \
          --transition-angle 135 || true
      '';
    };
  };
}
