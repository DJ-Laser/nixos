{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption types;
  cfg = config.${namespace}.tools.zoxide;
in {
  options.${namespace}.tools.zoxide = {
    enable = mkEnableOption "enables the zoxide cd tool";

    command = mkOption {
      type = types.uniq types.str;
      default = "cd";
      example = "z";
      description = "The command alias for zoxide";
    };

    options = mkOption {
      type = types.listOf types.str;
      default = [];
      example = ["--no-aliases"];
      description = "List of options to pass to zoxide";
    };
  };

  config = mkIf cfg.enable {
    ${namespace}.tools.zoxide.options = ["--cmd ${cfg.command}"];

    programs.zoxide = {
      enable = true;
      options = cfg.options;
    };
  };
}
