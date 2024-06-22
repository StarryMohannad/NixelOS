{ config, pkgs, ... }:

{
 imports = [
  ./dirs.nix
  ./impermanence.nix
  ./kitty.nix
  ./mime.nix
  ./mpd.nix
  ./ncmpcpp.nix
  ./packages.nix
 
  ../hyprland/default.nix
 ];
}
