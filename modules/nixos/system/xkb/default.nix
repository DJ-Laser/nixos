{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: {
  config = {
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
