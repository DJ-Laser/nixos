{
  flake.modules.homeManager.n16-shell = {pkgs, ...}: {
    home.packages = [pkgs.n16-shell];

    programs.niri = {
      settings.spawn-at-startup = [
        {command = ["${pkgs.n16-shell}/bin/n16-daemon"];}
      ];
    };
  };
}
