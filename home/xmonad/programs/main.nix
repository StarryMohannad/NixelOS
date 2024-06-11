{ config, pkgs, inputs, ... }:

{

 programs.ncmpcpp.enable = true;

 imports = [
   ./firefox.nix
   ./git.nix
   ./gpg.nix
 ];
}
