{
  den.aspects.direnv = {
    nixos.programs.direnv = {
      enable = true;

      nix-direnv = {
        enable = true;
      };
    };
  };
}
