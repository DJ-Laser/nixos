{
  den.aspects.btop = {
    homeManager = {
      pkgs,
      lib,
      options,
      ...
    }: {
      programs.btop = {
        enable = true;
        settings = {
          # Use stylix tty colors instead of the stylix custom theme
          color_theme = "TTY";
          theme_background = true;
          truecolor = true;
        };
      };

      # Disable stylix theming and use TTY colors
      stylix.targets.btop.enable = false;
    };
  };
}
