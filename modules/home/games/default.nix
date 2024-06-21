{ config, pkgs, ... }:

{
 imports = [
   ./packages.nix
 ];

 programs.mangohud.enable = true;
}
