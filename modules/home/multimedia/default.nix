{ config, pkgs, ... }:

{
 import = [
   ./packages.nix
   ./impermanence.nix
 ];
}
