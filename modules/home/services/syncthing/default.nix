{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.services.syncthing;
in {
  options.${namespace}.services.syncthing = {
    enable = lib.mkEnableOption "Enables the syncthing serbice";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      extraOptions = ["--no-default-folder"];

      settings = {
        folders = {
          "music" = {
            id = "music";
            path = "~/Music";
            label = "Music";
          };
        };
      };
    };
  };
}
