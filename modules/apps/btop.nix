{
  den.aspects.btop = {
    homeManager = {
      stylix.targets.btop.enable = false;

      programs.btop = {
        enable = true;
        settings = {
          # Use stylix tty colors instead of the stylix custom theme
          color_theme = "TTY";
          theme_background = true;
          truecolor = true;
        };
      };
    };
  };
}
