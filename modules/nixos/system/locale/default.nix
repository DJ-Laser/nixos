{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}: {
  config = {
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "us";
  };
}
