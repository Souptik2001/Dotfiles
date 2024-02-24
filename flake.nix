{
  description = "Souptik's NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      # To make sure `home-manager` doesn't use different version of `nixpkgs`, say `home-manager` to follow the nixpkgs module version.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {

    # starting point of an x86_64 NixOS installation
    nixosConfigurations = {
      souptik_hp = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            imports = [ ./hosts/souptik_hp/configuration.nix ];
            _module.args.self = self;
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.souptik = {
              imports = [ ./hosts/souptik_hp/home.nix ];
              _module.args.self = self;
              _module.args.host = "souptik_hp";
              _module.args.inputs = inputs;
            };
          }
        ];
      };
    };

  };

}