{
  flake.modules.homeManager.homeslashmusic = {pkgs, ...}: {
    home.packages = with pkgs; [homeslashmusic];

    systemd.user.services.homeslashmusic = {
      Unit = {
        Description = "Start the homeslashmusic audio server.";
      };
      Install = {
        WantedBy = ["default.target"];
      };
      Service = {
        ExecStart = "${pkgs.homeslashmusic}/bin/hsm-server";
      };
    };
  };
}
