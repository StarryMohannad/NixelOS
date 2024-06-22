{
 description = "NixelOS Flake :DD";
     
 inputs = {
   arkenfox.url = "git+https://github.com/dwarfmaster/arkenfox-nixos?ref=main";
   arkenfox.inputs.nixpkgs.follows = "nixpkgs";

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
     (import ./modules/disko.nix { device = "/dev/nvme0n1"; })
     inputs.stylix.nixosModules.stylix
     inputs.home-manager.nixosModules.default
     inputs.impermanence.nixosModules.impermanence
   ];
   args = { inherit inputs; };
   in {
     nixosConfigurations."cherry" = nixpkgs.lib.nixosSystem { specialArgs = args; modules = GlobalModules ++ [ ./flavors/cherry/system.nix ]; };
     nixosConfigurations."black-cherry" =  nixpkgs.lib.nixosSystem { specialArgs = args; modules = GlobalModules ++ [ ./flavors/black-cherry/system.nix ]; };
   };
}
