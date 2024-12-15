{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.shells.bash;
in {
  options.${namespace}.shells.bash = {
    enable = lib.mkEnableOption "enables bash shell management via home-manager";
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
    };
  };
}
