{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.steam;
in {
  options.${namespace}.apps.steam = {
    enable = lib.mkEnableOption "Enables the steam app";
  };

  config = {
    programs.steam = lib.mkIf cfg.enable {
      enable = true;
      gamescopeSession.enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    programs.gamemode.enable = lib.mkIf cfg.enable true;
  };
}
