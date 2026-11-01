{
  lib,
  yaziPlugins,
  fetchFromGitHub,
}:
yaziPlugins.mkYaziPlugin {
  pname = "git.yazi";
  version = "0-unstable-2026-05-09";

  src = fetchFromGitHub {
    owner = "olibrks";
    repo = "filechooser.yazi";
    rev = "ce1fec274194cbebff4ba398b57e6aaca8d6ae84";
    hash = "sha256-+9pzOZkXZRM+iNqe6S/l4+o5CKlRORLnRlhoTeSfV04=";
  };

  meta = {
    description = "Yazi plugin for file picking";
    license = lib.licenses.mit;
  };
}
