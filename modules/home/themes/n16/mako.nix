{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  n16 = config.${namespace}.themes.n16;
  mako = config.${namespace}.desktops.components.mako;
in {
  config.services.mako = lib.mkIf (n16.enable
    && mako.enable) {
    borderSize = 2;
    anchor = "bottom-right";
  };
}
