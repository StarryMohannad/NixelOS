{
 description = "NixelOS Flake :DD";
     
 inputs = {
   nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

   disko = {
     url = "github:nix-community/disko";
     inputs.nixpkgs.follows = "nixpkgs";
   };

   impermanence = {
     url = "github:nix-community/impermanence";
   };

   home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };

   firefox-addons = {
     url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
     inputs.nixpkgs.follows = "nixpkgs";
   }; 

   stylix.url = "github:danth/stylix";

 };

 outputs = {nixpkgs, ...} @ inputs:
 {
    nixosConfigurations."main" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.disko.nixosModules.default
        (import ./disko.nix { device = "/dev/nvme0n1"; })

        ./cores/main.nix
              
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.default
        inputs.impermanence.nixosModules.impermanence
      ];
    };
 };
}
