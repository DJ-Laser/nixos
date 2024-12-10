{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    snowfall-lib.url = "github:snowfallorg/lib";
    snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #agenix.url = "github:ryantm/agenix";
    #agenix.inputs.nixpkgs.follows = "nixpkgs";
    # Don't download darwin deps (macos cringe)
    #agenix.inputs.darwin.follows = "";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall = {
        namespace = "djlaser";
        meta = {
          name = "djlaser-nixos-config";
          title = "DJ_Laser's Nixos Config";
        };
      };

      channels-config = {
        # Allow unfree packages.
        allowUnfree = true;
      };

      systems.modules.nuxos = with inputs; [
        home-manager.nixosModules.home-manager
      ];

      systems.hosts.nix-desktop.modules = with inputs; [
        nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
        nixos-hardware.nixosModules.common-cpu-intel
      ];
    };
}
