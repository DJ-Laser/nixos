{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.fd;
in {
  options.${namespace}.apps.fd = {
    enable = lib.mkEnableOption "Whether to enable fd";
  };

  config = lib.mkIf cfg.enable {
    programs.fd = {
      enable = true;
    };
  };
}
