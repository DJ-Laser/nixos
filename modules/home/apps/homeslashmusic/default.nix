{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.homeslashmusic;
in {
  options.${namespace}.apps.homeslashmusic = {
    enable = lib.mkEnableOption "Whether to enable homeslashmusic";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [homeslashmusic];

    systemd.user.services.homeslashmusic = {
      Unit = {
        Description = "Start the homeslashmusic audio server.";
      };
      Install = {
        WantedBy = ["default.target"];
      };
      Service = {
        ExecStart = "${pkgs.homeslashmusic}/bin/hsm-server";
      };
    };
  };
}
