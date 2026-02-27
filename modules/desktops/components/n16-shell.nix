{
  den.aspects.n16-shell = {
    homeManager = {
      inputs',
      pkgs,
      ...
    }: let
      package = inputs'.n16-shell.packages.n16-shell;
    in {
      home.packages = [package];

      programs.niri = {
        settings.spawn-at-startup = [
          {command = ["${package}/bin/n16-daemon"];}
        ];
      };
    };
  };
}
