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

  config = lib.mkIf cfg.enable ({
      ${namespace}.desktops.components.swww.enable = true;
      stylix.targets.niri.enable = true;

      programs.niri = {
        settings.binds = import ./config/binds.nix {
          inherit pkgs;
          actions = config.lib.niri.actions;
        };
      };
    }
    // (
      if builtins.hasAttr "programs.niri.enable" options
      then {enable = true;}
      else {}
    ));
}
