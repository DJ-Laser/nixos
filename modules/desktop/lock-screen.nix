{
  den.aspects.lock-screen = {
    homeManager = {
      programs.hyprlock = {
        enable = true;
        settings.auth = {
          "pam:module" = "login";
        };
      };
    };
  };
}
