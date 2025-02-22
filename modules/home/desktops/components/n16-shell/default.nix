{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) types mkEnableOption mkOption mkIf;
  cfg = config.${namespace}.desktops.components.n16-shell;
  niriCfg = config.${namespace}.desktops.niri;
in {
  options.${namespace}.desktops.components.n16-shell = {
    enable = mkEnableOption "enables n16-shell desktop components";
    package = mkOption {
      type = types.package;
      default = pkgs.n16-shell;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];

    programs.niri = mkIf niriCfg.enable {
      settings.spawn-at-startup = [
        {command = ["${cfg.package}/bin/n16" "--daemon"];}
      ];
    };
  };
}
