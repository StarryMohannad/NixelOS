{ config, pkgs, inputs, ... }:

{
 imports = [
   ./firefox.nix
   ./ncmpcpp.nix
 ];
}
