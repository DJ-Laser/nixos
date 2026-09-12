{
  den.aspects.locale = {
    nixos = {lib, ...}: {
      time.timeZone = lib.mkDefault "America/New_York";
      i18n.defaultLocale = "en_US.UTF-8";
      console.keyMap = "us";
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
