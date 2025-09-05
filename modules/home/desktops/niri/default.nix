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

  inherit (lib) mkIf mkDefault mkEnableOption mkMerge;
in {
  options.${namespace}.desktops.niri = {
    enable = mkEnableOption "enables the Niri Wayland Compositor";
    xwayland.enable = mkEnableOption "enables xwayland for niri" // {default = true;};
  };

  config = mkIf cfg.enable {
    ${namespace} = {
      desktops.components.swww.enable = mkDefault true;
      desktops.components.mako.enable = mkDefault true;
      desktops.components.n16-shell.enable = mkDefault true;
    };

    stylix.targets.niri.enable = mkDefault true;

    programs.niri.settings = mkMerge [
      {
        prefer-no-csd = mkDefault true;
        screenshot-path = mkDefault "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        binds = import ./config/binds.nix {
          inherit lib pkgs;
          actions = config.lib.niri.actions;
        };
      }
      (mkIf cfg.xwayland.enable {
        spawn-at-startup = [{command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];}];

        environment = {
          # xwayland-satellite
          DISPLAY = ":0";
          # vscode and other apps don't want to default to wayland but work when forced
          ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        };
      })
    ];
  };
}
