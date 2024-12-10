{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.desktops.plasma-6;
in {
  options.${namespace}.desktops.plasma-6 = {
    enable = lib.mkEnableOption "enables the KDE Plasma 6 desktop environment";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    programs.dconf.enable = true;

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };

    environment.plasma6.excludePackages = with pkgs; [
      plasma-browser-integration
      konsole
      ark
      elisa
      gwenview
      okular
      kate
      khelpcenter
    ];
  };
}
