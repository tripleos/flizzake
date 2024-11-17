{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./flizz-fonts.nix
    ./common-virt.nix
  ];

  users.users.flizz = {
    isNormalUser = true;
    description = "the inator";
    # https://mynixos.com/nixpkgs/option/users.users.%3Cname%3E.home
    home = "/home/flizz";

    packages = with pkgs; [
      # firefox
      librewolf
      # zen

      jetbrains.idea-community
      # jetbrains.idea-community-src
      # eclipses.eclipse-modeling
      # eclipses.eclipse-scala-sdk

      # vscodium

      maven
      gradle
      jdk17
      jdk8

      ripgrep
      bat

      # soft-serve

      # gh
      # tea
      # codeberg-cli
      # github-desktop

      # exercism
    ];

    extraGroups = [
      "wheel"
      #"corectrl"
      #"gamemode"
      "video"

      "networkmanager"
      "adbusers"
      "wireshark"
      "libvirtd"
    ];
  };

  programs.bash.enableCompletion = true;

  programs.java.enable = true;
  #  programs.steam.enable = true;

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    #    wlr.enable = true;
    #    configPackages = [pkgs.gnome.gnome-session];
    #    extraPortals = [pkgs.xdg-desktop-portal-gtk
    #pkgs.xdg-desktop-portal-wlr
    #    ];
  };

  nixpkgs.config.allowUnfree = false; # true;

  environment.systemPackages = with pkgs; [
    wget
    curl

    mc
    htop

    lm_sensors
    pciutils
    usbutils
    gptfdisk
    htop
    nload
    gnupg
    direnv
    home-manager
    sbctl

    guix

    alsa-utils
    binutils-unwrapped
    imagemagick
    sl
    usbutils

    lrzip
    p7zip
    
    #unfree
    #unrar

    bcachefs-tools
    docker-compose

    # qzy
    htop
    lsof
    conky
    zfs
    mc

    zip
    unzip

    wget
    curl

    pydf

    ddrescue
    util-linux # (sfdisk)
    mergerfs

    polybarFull

    # prefixed in 23.11
    gnome.gnome-disk-utility
    gedit
    xed-editor

    gitFull
    lazygit

    btrfs-progs
    squashfsTools
    cryptsetup

    # seaweedfs

    ripgrep

    gnome3.gvfs
    gvfs

    lxmenu-data
    shared-mime-info

    xclip
    xorg.xkill
    # xdiskusage

    usbutils

    # corectrl # by nsc
    # zeal
    # nemiver

    # curtail
    # clapper

    # nyxt

    vscodium

    # onlyoffice

    gnumake
    #gnome.gpaste # for clipboard which I cant get to work

    sct
    scite
    parted
    gparted

    gitFull
    git-lfs
    lazygit

    mc
    ripgrep
    vlc
    bat
    rclone

    jdk17_headless
    jdk17
    python3

    nix-direnv
    niv

    atuin
    thefuck

    gitea-actions-runner
    tea

    vscodium
    nettools

    gnome.gnome-tweaks
    chrome-gnome-shell

    python311Packages.pip
    jq
    ffmpeg_4-headless

    asciinema
    python311Packages.xstatic-asciinema-player

    #Original flake URL: github:ananthakumaran/paisa
    ledger

    jujutsu
    vlc
    cinnamon.nemo
    cinnamon.nemo-python
    cinnamon.nemo-with-extensions
    gnumake
    yt-dlp
    bat
    gnome.gnome-terminal
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
