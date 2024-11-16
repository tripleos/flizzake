{
  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:3000"; # externally visible URL
    notificationSender = "hydra@localhost"; # e-mail of hydra service
    # a standalone hydra will require you to unset the buildMachinesFiles list to avoid using a nonexistant /etc/nix/machines
    buildMachinesFiles = [];
    # you will probably also want, otherwise *everything* will be built from scratch
    useSubstitutes = true;
  };

  nix.buildMachines = [
    {
      hostName = "localhost";
      system = "x86_64-linux";
      supportedFeatures = ["kvm" "nixos-test" "big-parallel" "benchmark"];
      maxJobs = 8;
    }
  ];

  nix.distributedBuilds = true;

  ## # su - hydra
  ## $ hydra-create-user alice --full-name 'Alice Q. User' \
  ##  --email-address 'alice@example.org' --password-prompt --role admin
}
