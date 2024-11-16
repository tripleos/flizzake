{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./flizz-boot.nix
    ./flizz-fs.nix
    ./flizz-services.nix
    ./flizz-sys.nix
    ./flizz-user.nix
  ];

  # nixpkgs.config.allowUnfree = true;

  system.includeBuildDependencies = true;
  system.stateVersion = "23.11"; # Did you read the comment?
  # ^^ gnome patch only
}
