{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: {
  imports = [./niri.nix ./mako.nix];

  options.${namespace}.themes.n16 = {
    enable = lib.mkEnableOption "enables the n16 theme";
  };
}
