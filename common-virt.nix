{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.virt-manager.enable = true;

  programs.dconf.enable = true; # virt-manager requires dconf to remember settings

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      # dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      ##defaultNetwork.settings.dns_enabled = true;
      # For Nixos version > 22.11
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };

    docker = {
      enable = true;
      #      storageDriver = "btrfs";
    };

    virtualbox = {
      host = {
        # Enable VirtualBox (don't install the package)
        enable = true;
        # NOTE: this eats a source build of VirtualBox. Disable if a rebuild is taking too long.
        ##        enableExtensionPack = true;
      };
    };

    libvirtd = {
      enable = true;
    };
  };

  users.extraGroups.docker.members = ["olu"];
}
