{ config, pkgs, ... }:

{
 imports = [
   ./packages.nix
   ./impermanence.nix
 ];
}
