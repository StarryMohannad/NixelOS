{ config, pkgs, ...}:

{
 imports = [
   ./impermanence.nix
   ./packages.nix
   ./session-varibles.nix
   ./theme.nix
 ];
}
