{
 description = "NixelOS Flake :DD";
     
 inputs = {
   disko.inputs.nixpkgs.follows = "nixpkgs";
   disko.url = "github:nix-community/disko";

   firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
   firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   home-manager.url = "github:nix-community/home-manager";

   impermanence.url = "github:nix-community/impermanence";
   nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
   stylix.url = "github:danth/stylix";
 };

 outputs = {nixpkgs, ...} @ inputs: let
   GlobalModules = [
     inputs.disko.nixosModules.default
     (import ./disko.nix { device = "/dev/nvme0n1"; })
     inputs.stylix.nixosModules.stylix
     inputs.home-manager.nixosModules.default
     inputs.impermanence.nixosModules.impermanence
   ];
   in {
     nixosConfigurations."cherry" = nixpkgs.lib.nixosSystem {
       specialArgs = {inherit inputs;};
       modules = GlobalModules ++ [ ./flavors/cherry/system.nix ];
   };
   nixosConfigurations."black-cherry" = nixpkgs.lib.nixosSystem {
     specialArgs = {inherit inputs;};
     modules = GlobalModules ++ [ ./flavors/black-cherry/system.nix ];
   };
 };
}
