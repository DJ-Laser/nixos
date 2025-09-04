{
  lib,
  pkgs,
  actions,
  ...
} @ args: let
  general = import ./binds/general.nix args;
  window-movement = import ./binds/window-movement.nix args;
  fn-keys = import ./binds/fn-keys.nix args;
in
  general // window-movement // fn-keys
