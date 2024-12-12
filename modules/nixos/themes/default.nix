{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: {
  config = {
    home-manager.sharedModules = [
      {
        stylix.targets.kde.enable = false;
      }
    ];
  };
}
