{
  lib,
  pkgs,
  actions,
  ...
} @ args: let
  general = import ./general.nix args;
  window-movement = import ./window-movement.nix args;
  fn-keys = import ./fn-keys.nix args;
in
  general // window-movement // fn-keys
