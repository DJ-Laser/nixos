{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.ripgrep;
in {
  options.${namespace}.apps.ripgrep = {
    enable = lib.mkEnableOption "Whether to enable ripgrep";
  };

  config = lib.mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}
