{
  den.aspects.usb-automount = {
    nixos = {
      services.udisks2.enable = true;
    };

    homeManager = {
      services.udiskie.enable = true;
    };
  };
}
