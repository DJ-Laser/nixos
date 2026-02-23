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

  inherit (lib) types mkIf mkDefault mkEnableOption mkOption mkMerge;
in {
  options.${namespace}.desktops.niri = {
    enable = mkEnableOption "enables the Niri Wayland Compositor";
    xwayland.enable = mkEnableOption "enables xwayland for niri" // {default = true;};

    screenLocker = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
  };

  config = mkIf cfg.enable {
    ${namespace} = {
      desktops.components.swww.enable = mkDefault true;
      desktops.components.mako.enable = mkDefault true;
      desktops.components.n16-shell.enable = mkDefault true;
      desktops.components.hyprlock.enable = mkDefault true;
      desktops.components.hypridle.enable = mkDefault true;
      desktops.components.hypridle.screenLocker = cfg.screenLocker;
    };

    stylix.targets.niri.enable = mkDefault true;

    home.packages = mkIf cfg.xwayland.enable [pkgs.xwayland-satellite];

    programs.niri.settings = mkMerge [
      {
        prefer-no-csd = mkDefault true;
        screenshot-path = mkDefault "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        binds = import ./config/binds.nix {
          inherit lib pkgs;
          actions = config.lib.niri.actions;
          screenLocker = cfg.screenLocker;
        };

        switch-events.lid-close.action.spawn = cfg.screenLocker;

        environment = {
          # vscode and other apps don't want to default to wayland but work when forced
          ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        };
      }
    ];
  };
}
