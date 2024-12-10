{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.${namespace}.apps.alacrity;
in {
  options.${namespace}.apps.alacrity = {
    enable = lib.mkEnableOption "Enables the alacrity terminal";
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}
