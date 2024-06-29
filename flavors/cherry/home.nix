{ inputs, config, pkgs, ... }:

{
 imports = [
   inputs.impermanence.nixosModules.home-manager.impermanence
   ../../modules/global/home.nix

   ../../modules/window-manager/home.nix
   ../../modules/syncthing/home.nix
   ../../modules/hyprland/home.nix
   ../../modules/shell/home.nix
   ../../modules/dev/home.nix

   ../../modules/games/home.nix
   ../../modules/nixvim/home.nix
   ../../modules/firefox/home.nix
   ../../modules/multimedia/home.nix

   ../../modules/discord/home.nix
   ../../modules/keepassxc.nix
 ];

 home.stateVersion = "24.05";
}
