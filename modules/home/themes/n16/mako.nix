{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  theme-cfg = config.${namespace}.themes.n16;
  mako-cfg = config.${namespace}.desktops.components.mako;
in {
  config.services.mako = lib.mkIf (theme-cfg.enable && mako-cfg.enable) {
    settings = {
      border-size = 2;
      anchor = "bottom-right";
    };
  };
}
