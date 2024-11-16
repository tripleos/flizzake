{
  description = "flizz flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.demo = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        #./configuration.nix
        ./flizz.nix
        # inputs.home-manager.nixosModules.default
      ];
    };
  };
}
