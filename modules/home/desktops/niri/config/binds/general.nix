{
  lib,
  pkgs,
  actions,
  ...
}:
with actions; {
  # Application hotkeys
  "Mod+Shift+Slash".action = show-hotkey-overlay;
  "Mod+T" = {
    hotkey-overlay.title = "Open the Alacritty terminal";
    action = spawn "alacritty";
  };
  "Mod+Shift+T" = {
    hotkey-overlay.title = "Silly :3";
    action = spawn "alacritty" "-e" "${pkgs.cmatrix}/bin/cmatrix";
  };
  "Mod+D" = {
    hotkey-overlay.title = "Open the N16 Launcher";
    action = spawn "n16" "launcher" "open";
  };

  # Workspace overview
  "Mod+O".action = open-overview;

  "Mod+Q".action = close-window;

  # Disables inhibition of shortcut keys (eg. for remote desktops)
  "Mod+Escape" = {
    action = toggle-keyboard-shortcuts-inhibit;
    allow-inhibiting = false;
  };

  # Disable monitors until keypress or mouse activity
  "Mod+Shift+P".action = power-off-monitors;

  # Quit niri
  "Mod+Shift+E".action = quit;
}
