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
  options.${namespace}.services.rustdesk-server = {
    enable = lib.mkEnableOption "enables the rustdesk-server systemd user unit";
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services.rustdesk-server = {
      Unit = {
        Description = "Rustdesk Server";
      };

      Service = {
        ExecStart = "pm2 start ${pkgs.rustdesk-server}/bin/hbbs & pm2 start ${pkgs.rustdesk-server}/bin/hbbr";
      };

      Install = {
        WantedBy = "default.target";
      };
    };
  };
}