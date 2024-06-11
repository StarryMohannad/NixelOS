{ config, pkgs, inputs, ... }:

{
 imports = [
   ./firefox.nix
   ./git.nix
   ./gpg.nix
   ./ncmpcpp.nix
 ];
}
