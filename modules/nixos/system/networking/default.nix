{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}: {
  config = {
    networking.networkmanager.enable = true;
  };
}
