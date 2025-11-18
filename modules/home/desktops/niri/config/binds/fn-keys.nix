{
  lib,
  pkgs,
  actions,
  ...
}:
with actions; {
  # Screenshot tool
  #FIXME change when niri-flake parser is fixed
  "Print".action.screenshot = [];
  "Ctrl+Print".action.screenshot-screen = [];
  "Alt+Print".action.screenshot-window = [];

  # Audio controls
  "XF86AudioRaiseVolume" = {
    action = spawn "wpctl" "set-volume" "-l" "1.0" "@DEFAULT_AUDIO_SINK@" "0.025+";
    allow-when-locked = true;
  };
  "XF86AudioLowerVolume" = {
    action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.025-";
    allow-when-locked = true;
  };
  "XF86AudioMute" = {
    action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
    allow-when-locked = true;
  };

  "XF86AudioPlay" = {
    action = spawn "playerctl" "play-pause";
    allow-when-locked = true;
  };
  "XF86AudioStop" = {
    action = spawn "playerctl" "stop";
    allow-when-locked = true;
  };
  "XF86AudioPrev" = {
    action = spawn "playerctl" "previous";
    allow-when-locked = true;
  };
  "XF86AudioNext" = {
    action = spawn "playerctl" "next";
    allow-when-locked = true;
  };

  # Brightness controls
  "XF86MonBrightnessDown" = {
    action = spawn "brightnessctl" "s" "-n" "2.5%-";
    allow-when-locked = true;
  };
  "XF86MonBrightnessUp" = {
    action = spawn "brightnessctl" "s" "2.5%+";
    allow-when-locked = true;
  };
}
