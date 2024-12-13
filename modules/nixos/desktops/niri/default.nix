{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.desktops.plasma-6;
in {
  options.${namespace}.desktops.niri = {
    enable = lib.mkEnableOption "enables the Niri Wayland Compositor";
  };

  config = {
    programs.niri.enable = true;
  };
}
