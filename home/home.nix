{ pkgs, ... }: {
  home = rec {
    stateVersion = "23.11";
    enableNixpkgsReleaseCheck = true;
    username = "flizz";
    homeDirectory = "/home/flizz";

    sessionVariables = {
      VISUAL = "mcedit";
    };

    pointerCursor = {
      gtk.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    packages = with pkgs; [
      # element-desktop
      # discord
      open-in-mpv
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.freon
      mc
    ];

    file = {
      "open-in-mpv_config.yml" = {
        enable = true;
        target = ".config/open-in-mpv/config.yml";

        text = pkgs.lib.generators.toYAML { } {
          players.mpv = {
            name = "mpv";
            executable = "${pkgs.mpv}/bin/mpv";
            supported_protocols = [ "http" "https" ];
          };
        };
      };
    };
  };
}
