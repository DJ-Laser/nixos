{
  den.aspects.greetd.nixos = {
    lib,
    pkgs,
    ...
  }: {
    services.greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session.command = lib.getExe' pkgs.tuigreet "tuigreet --time --user-menu --remember --remember-session";
      };
    };
  };
}
