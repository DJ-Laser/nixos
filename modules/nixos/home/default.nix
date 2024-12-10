{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) types mkOption;
  cfg = config.${namespace}.home;
in {
  options.${namespace}.home = with types; {
    file = mkOption {
      type = types.attrs;
      default = {};
      description = "A set of files to be managed by home-manager's `home.file`.";
    };
    configFile = mkOption {
      type = types.attrs;
      default = {};
      description = "A set of files to be managed by home-manager's `xdg.configFile`.";
    };
    extraOptions = mkOption {
      type = types.attrs;
      default = {};
      description = "Options to pass directly to home-manager.";
    };
  };

  config = {
    djlaser.home.extraOptions = {
      home.file = lib.mkAliasDefinitions options.${namespace}.home.file;
      xdg.enable = true;
      # Defaults to ~/.config`
      xdg.configFile = lib.mkAliasDefinitions options.${namespace}.home.configFile;
    };

    snowfallorg.users.dj_laser.home.config = config.${namespace}.home.extraOptions;

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
    };
  };
}
