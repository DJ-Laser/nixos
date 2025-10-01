{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}: {
  config = {
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
