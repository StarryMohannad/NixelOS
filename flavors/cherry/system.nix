{ inputs, config, lib, pkgs, ... }:
{
 imports = [ 
   ../../hosts/15s-eq2009ne.nix

   ../../modules/syncthing/system.nix
   ../../modules/hyprland/system.nix
   ../../modules/global/system.nix
   ../../modules/shell/system.nix
   ../../modules/dev/system.nix
 ];

 home-manager.extraSpecialArgs = {inherit inputs;};
 home-manager.users = {
   "starry" = import ./home.nix;
 };
 
 system.stateVersion = "24.05";
}

