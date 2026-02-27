{den, ...}: {
  den.aspects.steam = {
    includes = [
      (den._.unfree ["steam" "steam-unwrapped"])
    ];

    nixos = {
      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;

        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };

      programs.gamemode.enable = true;
    };
  };
}
