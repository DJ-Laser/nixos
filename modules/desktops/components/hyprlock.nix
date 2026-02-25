{
  flake.modules.homeManager.hyprlock = {
    stylix.targets.hyprlock.enable = true;

    programs.hyprlock = {
      enable = true;
      settings.auth = {
        "pam:module" = "login";
      };
    };
  };
}
