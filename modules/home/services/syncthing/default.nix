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
        devices = {
          nix-desktop = {
            id = "NV2AV5N-BUXWOUG-2N7TISV-RVJXTUI-ETIT62B-QGH4XU6-E3VR37K-6KZDYA3";
          };

          laser-book = {
            id = "TSEDB76-4JPPNAX-ZE5IVBR-2IOZYWR-SQIRNIN-JR4KSDK-OJB4GOG-UCOU4AK";
          };
        };

        folders = {
          "music" = {
            id = "music";
            path = "~/Music";
            label = "Music";

            devices = ["nix-desktop" "laser-book"];
          };
        };
      };
    };
  };
}
