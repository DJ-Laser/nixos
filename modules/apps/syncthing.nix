{
  den.aspects.syncthing = {
    homeManager = {pkgs, ...}: {
      services.syncthing = {
        enable = true;

        settings = {
          devices = {
            nix-desktop = {
              id = "NV2AV5N-BUXWOUG-2N7TISV-RVJXTUI-ETIT62B-QGH4XU6-E3VR37K-6KZDYA3";
            };

            laser-book = {
              id = "TSEDB76-4JPPNAX-ZE5IVBR-2IOZYWR-SQIRNIN-JR4KSDK-OJB4GOG-UCOU4AK";
            };

            pixel-3 = {
              id = "JWAUJWG-BETTPCF-XROIYBE-V45L6G2-WLMEXFK-6C7BBQE-VD6ALBZ-GRLODQK";
            };
          };

          folders = {
            "music" = {
              id = "music";
              path = "~/Music";
              label = "Music";

              devices = ["nix-desktop" "laser-book" "pixel-3"];
            };
          };
        };
      };
    };
  };
}
