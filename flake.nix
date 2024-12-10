{
  description = "DJ_Laser's NixOS config";

  inputs = {
    # NixOS official package source, using the unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    /*
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      #Don't download darwin deps (macos cringe)
      inputs.darwin.follows = "";
    };
    */

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        allowUnfree = true;
      };

      overlays = with inputs; [
        niri.overlays.niri
      ];

      systems.modules.nixos = with inputs; [
        niri.nixosModules.niri
      ];

      systems.hosts.nix-desktop.modules = with inputs; [
        nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
        nixos-hardware.nixosModules.common-cpu-intel
      ];
    };
}
