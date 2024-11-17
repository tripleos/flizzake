all:
	nix build .#nixosConfigurations."demo".config.system.build.toplevel
