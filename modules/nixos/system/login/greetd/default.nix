{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    types
    ;

  cfg = config.${namespace}.services.greetd;
in {
  options.${namespace}.services.greetd = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Use greetd + agreety on vt1.
      '';
    };
  };

  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session.command = "${pkgs.greetd}/bin/agreety -c '$SHELL'";
      };
    };
  };
}
