{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: {
  config = {
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };
}
