{
  den.aspects.greeter.nixos = {
    lib,
    pkgs,
    ...
  }: {
    services.greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session.command = lib.getExe' pkgs.tuigreet (lib.concatStringsSep " " [
          "tuigreet --issue --time"
          "--user-menu --user-menu-max-uid 30000"
          "--remember --remember-user-session"
        ]);
      };
    };
  };
}
