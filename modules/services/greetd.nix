{
  flake.modules.nixos.greetd = {pkgs, ...}: {
    services.greetd = {
      enable = true;
      settings = {
        default_session.command = "${pkgs.greetd}/bin/agreety -c '$SHELL'";
      };
    };
  };
}
