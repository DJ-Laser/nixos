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
    enable = mkEnableOption "";
  };
}
