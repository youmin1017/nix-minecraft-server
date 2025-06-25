{ self }:
let
  inherit (self) inputs outputs;
  inherit (inputs)
    nixpkgs
    home-manager
    ;

  username = "youmin";

  homeDir = self + /homes;
  hm-nixos = home-manager.nixosModules.home-manager;
  mkHost =
    { name, config }:
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit outputs inputs username;
        isDarwin = false;
      };
      system = "x86_64-linux";
      modules = [
        {
          # Hostname
          networking.hostName = name;

          # Impurity
          imports = [ inputs.impurity.nixosModules.impurity ];
          impurity.configRoot = self;
          impurity.enable = true;
        }
        config
        homeDir
        hm-nixos
      ];
      lib = nixpkgs.lib.extend (self: super: { custom = import ../lib { inherit (nixpkgs) lib; }; });
    };
in
{
  nixosConfigurations =
    let
      hosts = [
        {
          name = "nixos-mc";
          config = ./nixos-mc/configuration.nix;
        }
      ];
    in
    builtins.listToAttrs (
      map (host: {
        name = host.name;
        value = mkHost host;
      }) hosts
    );
}
