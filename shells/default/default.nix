{
  pkgs,
  mkShell,
  ...
}:
mkShell {
  packages = with pkgs; [alejandra nixd];
}
