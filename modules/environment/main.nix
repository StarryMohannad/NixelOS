{ config, pkgs, ... }:

{

 programs.rofi.enable = true;
 services.dunst.enable = true;

 imports = [
   ./mime.nix
   ./starship.nix
   ./trayer.nix
   ./zsh.nix
 ];
}
