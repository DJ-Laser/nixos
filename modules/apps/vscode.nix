{
  flake.modules.homeManager.vscode = {pkgs, ...}: {
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

          "rust-analyzer.check.command" = "clippy";

          "chat.disableAIFeatures" = true;
        };
      };
    };

    xdg.configFile."code-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';
  };
}
