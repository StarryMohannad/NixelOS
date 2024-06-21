{ config, pkgs, ... }:

{
 description = "Emulators and Launchers with utils";
 
 imports = [
   ./packages.nix
 ];

 programs.mangohud.enable = true;
}
