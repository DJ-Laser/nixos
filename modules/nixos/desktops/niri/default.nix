{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.desktops.niri;
in {
  options.${namespace}.desktops.niri = {
    enable = lib.mkEnableOption "enables the Niri Wayland Compositor";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
    };

    djlaser.home.extraOptions = {
      djlaser.desktops.niri = {
        enable = mkForce true;
      };
    };
  };
}
