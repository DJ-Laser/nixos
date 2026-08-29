{
  den.aspects.homeslashmusic = {
    homeManager = {
      inputs',
      pkgs,
      lib,
      ...
    }: let
      package = inputs'.homeslashmusic.packages.homeslashmusic;
    in {
      home.packages = [package];

      systemd.user.services.homeslashmusic = {
        Unit = {
          Description = "Start the homeslashmusic audio server.";
        };
        Install = {
          WantedBy = ["default.target"];
        };
        Service = {
          ExecStart = lib.getExe' package "hsm-server";
        };
      };
    };
  };
}
