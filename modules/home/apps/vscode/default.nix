{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.vscode;
in {
  options.${namespace}.apps.vscode = {
    enable = lib.mkEnableOption "Whether to enable the vscode editor";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
      profiles.default = {
        enableExtensionUpdateCheck = false;
        userSettings = {
          "editor.tabSize" = 2;
          "editor.formatOnSave" = true;
          "editor.linkedEditing" = true;

          "git.enableSmartCommit" = true;
          "git.autofetch" = true;
          "git.confirmSync" = false;

          "[typescript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };

          "[typescriptreact]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
        };
      };
    };

    xdg.configFile."code-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
  };
}
