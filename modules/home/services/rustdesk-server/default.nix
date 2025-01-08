{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.services.rustdesk-server;
in {
  options.${namespace}.services.rustdesk-server = {
    enable = lib.mkEnableOption "enables the rustdesk-server systemd user unit";
    workingDirectory = lib.mkOption {
      description = "The directory that the rustdesk service should keep it's files in. (relative to `home.homeDirectory`)";
      type = lib.types.str;
      example = "rustdesk-server";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services.rustdesk-server = {
      Unit = {
        Description = "Rustdesk Server";
      };

      Service = {
        ExecStart = "${pkgs.rustdesk-server}/bin/hbbs";
        WorkingDirectory = lib.path.append config.home.homeDirectory cfg.workingDirectory;
      };

      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
