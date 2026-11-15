{
  den.aspects.picard = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [picard chromaprint rsgain];
    };
  };
}
