{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}: {
  config = {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}
