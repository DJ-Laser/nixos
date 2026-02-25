{
  flake.modules.nixos.xkb = {
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
