{
  config,
  pkgs,
  ...
}: let
  alejandra =
    (import (builtins.fetchTarball {
      url = "https://github.com/kamadorueda/alejandra/tarball/3.0.0";
      sha256 = "18jm0d5xrxk38hw5sa470zgfz9xzdcyaskjhgjwhnmzd5fgacny4";
    }) {})
    .outPath;
in {
  environment.systemPackages = [alejandra
  # ,vscodium
  ];
}
