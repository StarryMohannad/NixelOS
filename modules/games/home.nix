{ config, pkgs, ... }:

{
 imports = [
   ./impermanence.nix
   ./packages.nix
 ];

 programs.mangohud.enable = true;
}
