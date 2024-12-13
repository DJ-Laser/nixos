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

  config = lib.mkIf (cfg.enable && true) ({
      ${namespace}.desktops.components.swww.enable = true;
      home.sessionVariables.NIXOS_OZONE_WL = "1";
      stylix.targets.niri.enable = true;

      programs.niri = {
        settings.binds = import ./config/binds.nix {actions = config.lib.niri.actions;};
      };
    }
    // (
      if builtins.hasAttr "programs.niri.enable" options
      then {enable = true;}
      else {}
    ));
}
