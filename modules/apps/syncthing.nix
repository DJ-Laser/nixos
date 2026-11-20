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

            pixel-9 = {
              id = "QQP4X3E-7HWZH74-6OHOIQ4-YGENZIX-5QG7IY2-MRRWVOP-IAJ2FWI-R55J7QN";
            };
          };

          folders = {
            "music" = {
              id = "music";
              path = "~/Music";
              label = "Music";

              devices = ["nix-desktop" "laser-book" "pixel-9"];
            };
          };
        };
      };
    };
  };
}
