{
  pkgs,
  actions,
}: let
  n16 = "${pkgs.n16-shell}/bin/n16";
in
  with actions; {
    "Mod+Shift+Slash".action = show-hotkey-overlay;
    "Mod+T".action = spawn "alacritty";
    "Mod+D".action = spawn n16 "launcher" "open";

    "Print".action = screenshot;
    # FIXME niri-flake broke screenshot-screen, uncomment after upstream fixes
    # "Ctrl+Print".action = screenshot-screen;
    "Alt+Print".action = screenshot-window;

    "Mod+Shift+E".action = quit;
    "Mod+Shift+P".action = power-off-monitors;

    "Mod+Q".action = close-window;

    "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "-l" "1.0" "@DEFAULT_AUDIO_SINK@" "0.05+";
    "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-";
    "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";

    "XF86AudioPlay".action = spawn "playerctl" "play-pause";
    "XF86AudioStop".action = spawn "playerctl" "stop";
    "XF86AudioPrev".action = spawn "playerctl" "previous";
    "XF86AudioNext".action = spawn "playerctl" "next";

    "XF86MonBrightnessDown".action = spawn "brightnessctl" "s" "-n" "2.5%-";
    "XF86MonBrightnessUp".action = spawn "brightnessctl" "s" "2.5%+";

    "Mod+Left".action = focus-column-left;
    "Mod+Down".action = focus-window-or-workspace-down;
    "Mod+Up".action = focus-window-or-workspace-up;
    "Mod+Right".action = focus-column-right;
    "Mod+H".action = focus-column-left;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+L".action = focus-column-right;

    "Mod+Shift+Left".action = focus-monitor-left;
    "Mod+Shift+Down".action = focus-window-or-monitor-down;
    "Mod+Shift+Up".action = focus-window-or-monitor-up;
    "Mod+Shift+Right".action = focus-monitor-right;
    "Mod+Shift+H".action = focus-monitor-left;
    "Mod+Shift+J".action = focus-window-or-monitor-down;
    "Mod+Shift+K".action = focus-window-or-monitor-up;
    "Mod+Shift+L".action = focus-monitor-right;

    "Mod+Ctrl+Left".action = move-column-left;
    "Mod+Ctrl+Down".action = move-window-down-or-to-workspace-down;
    "Mod+Ctrl+Up".action = move-window-up-or-to-workspace-up;
    "Mod+Ctrl+Right".action = move-column-right;
    "Mod+Ctrl+H".action = move-column-left;
    "Mod+Ctrl+J".action = move-window-down-or-to-workspace-down;
    "Mod+Ctrl+K".action = move-window-up-or-to-workspace-up;
    "Mod+Ctrl+L".action = move-column-right;

    "Mod+Ctrl+Shift+Left".action = move-column-to-monitor-left;
    "Mod+Ctrl+Shift+Down".action = move-column-to-monitor-down;
    "Mod+Ctrl+Shift+Up".action = move-column-to-monitor-up;
    "Mod+Ctrl+Shift+Right".action = move-column-to-monitor-right;
    "Mod+Ctrl+Shift+H".action = move-column-to-monitor-left;
    "Mod+Ctrl+Shift+J".action = move-column-to-monitor-down;
    "Mod+Ctrl+Shift+K".action = move-column-to-monitor-up;
    "Mod+Ctrl+Shift+L".action = move-column-to-monitor-right;

    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;
    "Mod+Ctrl+Home".action = move-column-to-first;
    "Mod+Ctrl+End".action = move-column-to-last;

    "Mod+Page_Down".action = focus-workspace-down;
    "Mod+Page_Up".action = focus-workspace-up;
    "Mod+U".action = focus-workspace-down;
    "Mod+I".action = focus-workspace-up;

    "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
    "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
    "Mod+Ctrl+U".action = move-column-to-workspace-down;
    "Mod+Ctrl+I".action = move-column-to-workspace-up;

    "Mod+Shift+Page_Down".action = move-workspace-down;
    "Mod+Shift+Page_Up".action = move-workspace-up;
    "Mod+Shift+U".action = move-workspace-down;
    "Mod+Shift+I".action = move-workspace-up;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";

    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";

    "Mod+R".action = switch-preset-column-width;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+C".action = center-column;

    "Mod+Comma".action = consume-or-expel-window-left;
    "Mod+Period".action = consume-or-expel-window-right;

    "Mod+WheelScrollDown" = {
      cooldown-ms = 150;
      action = focus-workspace-down;
    };

    "Mod+WheelScrollUp" = {
      cooldown-ms = 150;
      action = focus-workspace-up;
    };

    "Mod+Shift+WheelScrollDown".action = focus-column-right;
    "Mod+Shift+WheelScrollUp".action = focus-column-left;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;

    "Mod+Shift+1".action = move-column-to-workspace 1;
    "Mod+Shift+2".action = move-column-to-workspace 2;
    "Mod+Shift+3".action = move-column-to-workspace 3;
    "Mod+Shift+4".action = move-column-to-workspace 4;
    "Mod+Shift+5".action = move-column-to-workspace 5;
    "Mod+Shift+6".action = move-column-to-workspace 6;
    "Mod+Shift+7".action = move-column-to-workspace 7;
    "Mod+Shift+8".action = move-column-to-workspace 8;
    "Mod+Shift+9".action = move-column-to-workspace 9;
  }
