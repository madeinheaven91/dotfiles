{
	description = "heaven nixos hrensk";

	inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

    outputs = { self, nixpkgs, home-manager, ... }: {
        nixosConfigurations.heaven = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.madeinheaven91 = import ./home.nix;
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}
