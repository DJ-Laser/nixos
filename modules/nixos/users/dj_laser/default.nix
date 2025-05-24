{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}: let
  name = "dj_laser";
  cfg = config.${namespace}.users.${name};
in {
  config = {
    users.users.${name} = {
      inherit name;
      description = "Devin Myers";
      home = "/home/${name}";

      isNormalUser = true;
      group = "users";
      extraGroups = ["networkmanager" "wheel" "dialout"];
    };
  };
}
