{den, ...}: {
  den.aspects.podman = {
    includes = [
      den.aspects.subuid
    ];

    provides.to-hosts = {
      includes = [den.aspects.podman];
    };

    nixos = {
      virtualisation.podman = {
        enable = true;
      };
    };

    homeManager = {
      services.podman = {
        enable = true;
      };
    };
  };
}
