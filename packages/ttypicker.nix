{
  lib,
  pkg-config,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage {
  pname = "ttypicker";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "olibrks";
    repo = "ttypicker";
    rev = "8d2348e9c301706f35819249ba889bdbe3e2396f";
    hash = "sha256-DvopD3vOtFBsSaGXz41/IxxtZGMB0Cmhh01AxtDU6D8=";
  };

  cargoHash = "sha256-dJaWsr3upnwXmDAj4ZVnUI0Wr5/IZdcLQaOKFEQLHUQ=";

  nativeBuildInputs = [pkg-config];
  #buildInputs = [glib];

  postInstall = ''
    # Install systemd user service
    install -Dm644 share/ttypicker.service -t $out/lib/systemd/user/

    # Install D-Bus service
    install -Dm644 share/org.freedesktop.impl.portal.desktop.ttypicker.service -t $out/share/dbus-1/services/

    # Install XDG Desktop Portal
    install -Dm644 share/ttypicker.portal -t $out/share/xdg-desktop-portal/portals/

    # Fixup nix paths
    substituteInPlace $out/lib/systemd/user/ttypicker.service \
      --replace-fail "%h/.local/bin/ttypicker" "$out/bin/ttypicker"
  '';

  meta = with lib; {
    description = "XDG Desktop Portal FileChooser backend: use your terminal file manager as a file picker";
    homepage = "https://github.com/olibrks/ttypicker";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
