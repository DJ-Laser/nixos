{
  den.aspects.podman = {
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
