{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages =
      #[pkgs.linuxKernel.packages.linux_xanmod_stable.zfs]
      #++ [
      config.boot.zfs.package.latestCompatibleLinuxPackages
      # **
      # ] ++ [pkgs.linuxPackages_testing]
      # bcachefs
      ;

    kernelParams = [
      "console=ttyS0,115200"          # allows certain forms of remote access, if the hardware is setup right
      "panic=30"
      "boot.panic_on_fail" # reboot the machine upon fatal boot issues
    ];

    # redacted-005

    extraModprobeConfig = ''
      # options zfs l2arc_noprefetch=0 l2arc_write_boost=33554432 l2arc_write_max=16777216 zfs_arc_max=2147483648
    '';

    supportedFilesystems = [
      "zfs" # **
      # "bcachefs"
      "btrfs"
    ];

    zfs = {forceImportRoot = false;};
  };

  services.sanoid.enable = false; # **
  services.zfs.autoScrub.enable = true; # **

  # tmp.cleanOnBoot = true;

  # initrd = {
  #   supportedFilesystems = [
  #     "zfs"
  #     # "bcachefs"  ## ***
  #   ];
  #
  #   luks.devices."cryptswap".device = "/dev/disk/by-uuid/8b767a05-7c7d-4ce6-828a-1aa0805a7f41";
  # };
}
