{ config, pkgs, ...}:

{
 imports = [
   ./home-sub/impermanence.nix
   ./home-sub/packages.nix
   ./home-sub/session-varibles.nix
   ./home-sub/theme.nix
 ];

 programs.home-manager.enable = true;
}
