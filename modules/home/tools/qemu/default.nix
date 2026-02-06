{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.${namespace}.tools.qemu;
in {
  options.${namespace}.tools.qemu = {
    enable = mkEnableOption "Enables QEMU and quickemu";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.qemu pkgs.quickemu];
  };
}
