{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.yazi;
in {
  options.${namespace}.apps.yazi = {
    enable = lib.mkEnableOption "Whether to enable yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
