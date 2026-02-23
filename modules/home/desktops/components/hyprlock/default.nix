{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) types mkEnableOption mkOption mkDefault mkIf;
  cfg = config.${namespace}.desktops.components.hyprlock;
in {
  options.${namespace}.desktops.components.hyprlock = {
    enable = mkEnableOption "enables hyprlock";
    package = mkOption {
      type = types.package;
      default = pkgs.hyprlock;
    };
  };

  config = mkIf cfg.enable {
    stylix.targets.hyprlock.enable = mkDefault true;

    programs.hyprlock = {
      enable = true;
      package = cfg.package;
    };

    ${namespace}.desktops.niri.screenLocker = "hyprlock";
  };
}
