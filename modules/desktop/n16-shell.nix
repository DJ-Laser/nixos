{
  den.aspects.n16-shell = {
    homeManager = {
      inputs',
      pkgs,
      lib,
      ...
    }: let
      package = inputs'.n16-shell.packages.n16-shell;
    in {
      home.packages = [package];

      programs.niri = {
        settings.spawn-at-startup = [
          {command = [(lib.getExe' package "n16-daemon")];}
        ];
      };
    };
  };
}
